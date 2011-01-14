module Google
  module UrlShortener
    class Url < Base
      include Request
      attr_reader :long_url, :short_url, :status
      
      def initialize(opts={})
        opts.each_pair do |k, v|
          self.instance_variable_set(:"@#{k}", v)
        end
      end
      
      def decode!
        params   = validate_and_prepare_params(:shortUrl => self.short_url, :projection => "FULL")
        response = get(params)
        
        # TODO: get more info from response (analytics)
        @long_url = response["longUrl"]
      end
      alias_method :expand!, :decode!
      
      def encode!
        params   = validate_and_prepare_params(:longUrl => self.long_url)
        response = post(params)
        
        @short_url = response["id"]
      end
      alias_method :shorten!, :encode!
      
      private
      def validate_and_prepare_params(params={})
        params = params_for_request(params)
        
        params.each_pair do |k, v|
          validate(k, params)
        end
        
        params
      end
      
      def params_for_request(params={})
        base_params = { :key => self.class.api_key }
        base_params.merge!(params)
      end
      
      def validate(key, hash={})
        if hash[key].nil? || hash[key].empty?
          raise "Key :#{key} missing from request parameters!"
        end
      end
    end
  end
end
