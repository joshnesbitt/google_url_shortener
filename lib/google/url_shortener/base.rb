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
          begin
            @@api_key
          rescue NameError
            raise MissingApiKey, "No API key has been set!"
          end
        end
      end
    end
  end
end
