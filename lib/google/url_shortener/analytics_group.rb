module Google
  module UrlShortener
    class AnalyticsGroup
      attr_reader :raw,
                  :short_url_clicks,
                  :long_url_clicks,
                  :referrers,
                  :countries,
                  :browsers,
                  :platforms
      
      class << self
        def from_hash(hash)
          a = new(hash)
          a.parse_all!
          a
        end
      end
      
      def initialize(raw={})
        @raw = raw.dup
        @short_url_clicks = self.raw["shortUrlClicks"].to_i
        @long_url_clicks  = self.raw["longUrlClicks"].to_i
      end
      
      def parse_all!
        %w{ referrers countries browsers platforms }.each do |g|
          self.instance_variable_set(:"@#{g}", reverse_array(self.raw[g]))
        end
      end
      
      private
      def reverse_array(array=[])
        hash = {}
        
        return hash if array.nil?
        
        array.each do |entry|
          hash[entry["id"]] = entry["count"].to_i
        end
        
        hash
      end
    end
  end
end
