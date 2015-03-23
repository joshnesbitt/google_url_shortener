require 'spec_helper'

module Google
  describe UrlShortener do
    
    it "should shorten a URL" do
      stub_request(Google::UrlShortener::Request::BASE_URL, :method => :post, :fixture => "shorten")
      
      url = UrlShortener.shorten!(@long_url)
      url.should == @short_url
    end
    
    it "should expand a URL" do
      stub_request(Google::UrlShortener::Request::BASE_URL + "?shortUrl=#{@short_url}&projection=FULL&key=#{@key}", :fixture => "expand")
      
      url = UrlShortener.expand!(@short_url)
      url.should == @long_url
    end
  end
end
