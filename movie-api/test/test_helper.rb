ENV['RAILS_ENV'] ||= 'test'
require 'simplecov'
SimpleCov.start
require_relative "../config/environment"
require "rails/test_help"
require 'rspec/mocks/minitest_integration'
require 'rspec/mocks'

class ActiveSupport::TestCase

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  parallelize_setup do |worker|
    SimpleCov.command_name "#{SimpleCov.command_name}-#{worker}"
  end

  parallelize_teardown do |worker|
    SimpleCov.result
  end

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
