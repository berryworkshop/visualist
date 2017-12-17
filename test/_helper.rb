# test_helper.rb
ENV['RACK_ENV'] = 'test'
require 'json'
require 'rack/test'
require 'minitest/autorun'
require "minitest/reporters"
require_relative '../server.rb'
Minitest::Reporters.use!


