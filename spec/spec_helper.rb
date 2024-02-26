# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'
require 'capybara/rspec'
require 'support/controller_macros'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.extend ControllerMacros, :type => :controller

  config.include Devise::Test::IntegrationHelpers, type: :request
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
