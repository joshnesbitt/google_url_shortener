require 'restclient'
require 'json'
require 'date'

%w{ version request base url analytics analytics_group errors }.each do |f|
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
