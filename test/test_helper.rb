# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

# TODO: Enable bullet
# if Bullet.enable?
#   config.before(:each) { Bullet.start_request }
#   config.after(:each)  { Bullet.end_request }
# end
