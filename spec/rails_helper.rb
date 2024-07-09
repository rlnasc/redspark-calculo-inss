# frozen_string_literal: true

require 'simplecov'
SimpleCov.start 'rails' do
  add_filter 'vendor'
end

# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
require File.expand_path('../config/environment', __dir__)

require 'rspec/rails'
require 'factory_bot_rails'

RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.include FactoryBot::Syntax::Methods
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
