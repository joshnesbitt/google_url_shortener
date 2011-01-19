require 'trollop'
module Google
  module UrlShortener
    class CLI
      KEY_FILE = ".googl"
      KEY_PATH = "#{ENV["HOME"]}/#{KEY_FILE}"
      attr_reader :key, :options
      
      def initialize(args)
        @options = parse!(args)
      end
      
      def run!
        command = self.options[:command].to_sym
        args    = self.options[:args]
        
        unless [:install].include?(command)
          validate_key!
        end
        
        case command
        when :shorten, :s
          url   = validate!(:url, args.first)
          short = UrlShortener.shorten!(url)
          
          log(short)
        when :expand, :e
          short = validate!(:url, args.first)
          url   = Url.new(:short_url => short)
          url.expand!
          
          out = [url.long_url]
          
          if self.options[:analytics]
            out << decode_analytics(url)
            out.flatten!
          end
          
          log(out)
       when :install
         key = validate!(:key, args.first)
         
         install_key!(key)
         log "+ Installed key '#{key}' to #{KEY_PATH}"
        else
          die("unknown command '#{self.options[:command]}'")
        end
      end
      
      private
      def decode_analytics(url)
        out = [""]
        groups = [:all, :month, :week, :day, :two_hours]
        sub_groups = [:short_url_clicks, :long_url_clicks, :referrers, :countries, :browsers, :platforms]
        
        groups.each do |g|
          out << g.upcase
          group = url.analytics.send(g)
          
          sub_groups.each do |s|
            sub = group.send(s)
            
            if sub.is_a?(Hash)
              out << "#{" " * 2}#{s}:"
              out << sub.collect do |k, v|
                "#{" " * 4}#{k}: #{v}"
              end
            else
              out << "#{" " * 2}#{s}: #{sub}"
            end
          end
          
          out << ""
        end
        
        out
      end
      
      def parse!(args)
        opts = Trollop::options(args) do
          version VERSION
          banner File.read("#{GEM_ROOT}/USAGE")
          
          opt :analytics, "Show analytics when expanding a URL", :short => "-a", :default => false
        end
        
        opts.merge!(:command => args.shift)
        opts.merge!(:args => args)
        
        die("missing parameter (command)") if opts[:command].nil?
        
        opts
      end
      
      def install_key!(key)
        File.open(KEY_PATH, 'w') {|f| f.write(key) }
      end
      
      def validate_key!
        if File.exists?(KEY_PATH)
          @key = File.read(KEY_PATH)
          
          Base.api_key = @key
        else
          die("could not find API key. Please run the 'install' command to initialize.")
        end
      end
      
      def log(*things)
        $stdout.puts(*things)
      end
      
      def validate!(key, value)
        value.nil? ? die("missing parameter (#{key})") : value
      end
      
      def die(message)
        Trollop::die(message)
      end
    end
  end
end
