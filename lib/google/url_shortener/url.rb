module Google
  module UrlShortener
    class Url
      attr_reader :long_url, :short_url, :status
      
      def initialize(opts={})
        opts.each_pair do |k, v|
          self.instance_variable_set(:"@#{k}", v)
        end
      end
      
      def decode!
        # check for short
        resp = get(:shortUrl => self.short_url, :projection => "FULL")
        # TODO: get more info from response
        @long_url = resp["longUrl"]
      end
      
      def encode!
        # check for long
        resp = post(:longUrl => self.long_url)
        @short_url = resp["id"]
      end
      
      private
      def post(params={})
        # check for API key
        params.merge!(:key => Base.api_key)
        json = RestClient.post Base::URL, params.to_json, :content_type => :json, :accept => :json
        JSON.parse(json)
      end
      
      def get(params={})
        # check for API key
        params.merge!(:key => Base.api_key)

        json = RestClient.get Base::URL + "?" + params.collect { |k, v| "#{k}=#{v}" }.join("&")
        puts json
        JSON.parse(json)
      end
    end
  end
end
