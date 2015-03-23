module Google
  module UrlShortener
    module Request
      BASE_URL = "https://www.googleapis.com/urlshortener/v1/url"
      REQUEST_HEADERS = { :content_type => :json, :accept => :json }

      def post(params={})
        response = RestClient.post(format_url_with_api_key, format_post_params(params), REQUEST_HEADERS)
        parse(response)
      end

      def get(params={})
        full_url = [format_url_with_api_key, "&", format_get_params(params)].join
        response = RestClient.get(full_url)
        parse(response)
      end

      private
      def parse(response)
        JSON.parse(response)
      end

      def format_url_with_api_key()
        [BASE_URL, "?key=", self.class.api_key].join
      end

      def format_post_params(params={})
        params.to_json
      end

      def format_get_params(params={})
        params.collect { |k, v| "#{k}=#{v}" }.join("&")
      end
    end
  end
end
