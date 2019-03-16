require 'bundler'
require 'pry'
require 'nokogiri'
require 'open-uri'

Bundler.require 

require_all './lib'

require_relative '../lib/scraper'
require_relative '../lib/bestsellers'
require_relative '../lib/nyt_cli'
require_relative '../lib/nyt_bestsellers/version'