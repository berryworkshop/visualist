# test_helper.rb
ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'rack/test'
require "minitest/reporters"
Minitest::Reporters.use! #[Minitest::Reporters::DefaultReporter.new(:color => true)]

require File.expand_path '../../server.rb', __FILE__

