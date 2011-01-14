require 'google/url_shortener/version'
require 'google/url_shortener/base'
require 'google/url_shortener/url'

RestClient.log = $stdout

Google::UrlShortener::Base.api_key = "AIzaSyCDp22BuCNkkd_LwQmnzOKA-kA7GXjvOsI"

url = Google::UrlShortener::Url.new(:long_url => "http://blog.josh-nesbitt.net")
puts url.encode!.inspect

url = Google::UrlShortener::Url.new(:short_url => url.short_url)
puts url.decode!.inspect

# http://code.google.com/apis/urlshortener/v1/reference.html#method_urlshortener_url_get

