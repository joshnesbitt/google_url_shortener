$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
Dir[File.dirname(__FILE__) + "/helpers/*"].each { |f| require(f) }
require 'google_url_shortener'
require 'fakeweb'
require 'spec'
include FakewebHelper

Google::UrlShortener::Base.api_key = "TESTKEY"
