module Google
  module UrlShortener
    class Base
      class << self
        @@raise_exceptions = false
        
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

        def raise_exceptions=(bool)
          @@raise_exceptions = !!bool
        end

        def raise_exceptions
          @@raise_exceptions
        end
      end
    end
  end
end
