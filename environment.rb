ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'slim'
require 'sass'
require 'json'
require 'dinosaurus'

require_relative 'app'
require_relative 'helpers/dinosaurus_magic_helper'

Dinosaurus.configure do |config|
  config.api_key = ENV['API_KEY']
end