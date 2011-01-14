module Google
  module UrlShortener
    
    class UrlShortenerError < StandardError
      attr_accessor :data

      def initialize(data)
        self.data = data
        super
      end
    end
    
    class MissingApiKey < UrlShortenerError;end
  end
end