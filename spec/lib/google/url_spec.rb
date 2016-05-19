require 'spec_helper'

module Google
  module UrlShortener
    describe Url do
      
      it "should have the correct attributes after shortening a URL" do
        stub_request(Google::UrlShortener::Request::BASE_URL + "?key=#{@key}", :method => :post, :fixture => "shorten")
        
        url = Google::UrlShortener::Url.new(:long_url => @long_url)
        url.shorten!
        
        url.long_url.should  == @long_url
        url.short_url.should == @short_url
      end
      
      it "should have the correct attributes after expanding a URL" do
        stub_request(Google::UrlShortener::Request::BASE_URL + "?shortUrl=#{@short_url}&projection=FULL&key=#{@key}", :fixture => "expand")
        
        url = Google::UrlShortener::Url.new(:short_url => @short_url)
        url.expand!
        
        url.long_url.should  == @long_url
        url.short_url.should == @short_url
        url.created_at.year.should  == 2011
        url.created_at.month.should == 01
        url.created_at.day.should   == 11
      end

      it "should permit exceptions if raise_exceptions is true" do
        RestClient.stub(:post) { raise RestClient::Request::RequestFailed }
        prev_val = Base.raise_exceptions
        Base.raise_exceptions = true

        url = Google::UrlShortener::Url.new(:long_url => @long_url)
        expect { url.shorten! }.to raise_error(RestClient::Request::RequestFailed)

        Base.raise_exceptions = prev_val
      end

      it "should not raise exceptions if raise_exceptions is false" do
        RestClient.stub(:post) { raise RestClient::Request::RequestFailed }

        url = Google::UrlShortener::Url.new(:long_url => @long_url)
        expect { url.shorten! }.to_not raise_error(RestClient::Request::RequestFailed)
      end
    end
  end
end
