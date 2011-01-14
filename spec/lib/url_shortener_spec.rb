module Google
  describe UrlShortener do
    
    before do
      UrlShortener::Base.api_key = "TESTKEY"
    end
    
    it "should shorten a URL"
    it "should expand a URL"
  end
end
