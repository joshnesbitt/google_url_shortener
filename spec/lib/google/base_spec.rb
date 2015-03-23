require 'spec_helper'

module Google
  module UrlShortener
    describe Base do
      
      it "should allow an API key to be set" do
        key = "apikey"
        Base.api_key = key
        Base.api_key.should == key
      end
      
      it "should allow a logger to be set" do
        RestClient.log = nil
        RestClient.log.should == nil
        
        Base.log = $stdout
        RestClient.log.should == $stdout
        
        Base.log = nil
      end
    end
  end
end
