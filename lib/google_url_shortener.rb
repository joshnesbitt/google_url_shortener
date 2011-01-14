# TODO: remove
require 'rubygems'
require 'restclient'
require 'json'
# EO TODO

ROOT = File.expand_path(File.dirname(__FILE__) + "/..")

%w{ version
    request
    base
    url }.each { |f| require("#{ROOT}/lib/google/url_shortener/#{f}") }
