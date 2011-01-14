module Google
  module UrlShortener
    class Base
      class << self
        
        def log=(logger)
          RestClient.log = logger
        end
        
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
