# TODO: remove
require 'rubygems'
require 'restclient'
require 'json'
# EO TODO

module Google
  module UrlShortener
    class Base
      URL = "https://www.googleapis.com/urlshortener/v1/url"
      
      class << self
        
        def api_key=(key)
          @@api_key = key
        end
        
        def api_key
          @@api_key
        end
      end
    end
  end
end
