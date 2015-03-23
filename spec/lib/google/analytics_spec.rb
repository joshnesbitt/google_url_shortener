require 'spec_helper'

module Google
  module UrlShortener
    describe Analytics do
      
      before(:all) do
        stub_request(Google::UrlShortener::Request::BASE_URL + "?shortUrl=#{@short_url}&projection=FULL&key=#{@key}", :fixture => "expand")
        url = Google::UrlShortener::Url.new(:short_url => @short_url)
        url.expand!
        
        @analytics = url.analytics
      end
      
      it "should parse the analytics data correctly." do
        @analytics.all.browsers.class.should  == Hash
        @analytics.all.referrers.class.should == Hash
        @analytics.all.countries.class.should == Hash
        @analytics.all.platforms.class.should == Hash
        
        @analytics.all.browsers.should  include("Chrome")
        @analytics.all.referrers.should include("Unknown/empty")
        @analytics.all.countries.should include("GB")
        @analytics.all.platforms.should include("Macintosh")
        
        @analytics.all.short_url_clicks.should == 1
        @analytics.all.long_url_clicks.should  == 1
      end
    end
  end
end
