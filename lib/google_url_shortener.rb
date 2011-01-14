# TODO: remove
require 'rubygems'
require 'restclient'
require 'json'
# EO TODO

%w{ version
    request
    base
    url }.each { |f| require("google/url_shortener/#{f}") }
