$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'google_url_shortener'
require 'spec'

Google::UrlShortener::Base.api_key = "TESTKEY"

# TODO: fakeweb
