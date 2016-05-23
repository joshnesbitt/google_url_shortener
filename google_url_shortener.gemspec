# -*- encoding: utf-8 -*-
require File.expand_path("../lib/google/url_shortener/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "google_url_shortener"
  s.version     = Google::UrlShortener::VERSION
  s.platform    = Gem::Platform::RUBY
  s.executables = %w{ googl }
  s.authors     = ["Josh Nesbitt"]
  s.email       = ["josh@josh-nesbitt.net"]
  s.homepage    = "http://rubygems.org/gems/google_url_shortener"
  s.summary     = "A simple library to shorten and expand goo.gl URL's."
  s.description = "Google URL Shortener is a library to compress and expand goo.gl URL's. It also provides an interface to review the analytics of a short URL."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project = "google_url_shortener"

  s.add_dependency "json", ">= 1.4.6"
  s.add_dependency "rest-client", ">= 1.6.7"
  s.add_dependency 'trollop', '>= 1.16.2'

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rspec", "2.8.0"
  s.add_development_dependency "rspec-mocks", "2.8.0"
  s.add_development_dependency "fakeweb"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
