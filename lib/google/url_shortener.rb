require 'restclient'
require 'json'

%w{ version request base url }.each do |f|
  require("#{GEM_ROOT}/lib/google/url_shortener/#{f}")
end

module Google
  module UrlShortener
    class << self
      
      def shorten!(url)
        Url.new(:long_url => url).shorten!
      end
      
      def expand!(url)
        Url.new(:short_url => url).expand!
      end
    end
  end
end
