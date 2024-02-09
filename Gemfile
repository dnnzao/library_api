#
#Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/Gemfile
#Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api
#Created Date: Thursday, February 1st 2024, 4:02:58 pm
#Author: Dênio Barbosa Júnior
#
#Copyright (c) 2024 Your Company
#


source "https://rubygems.org"

ruby '3.0.2'

gem 'pg', "~> 1.1"
gem 'rails', '7.1.3'
gem 'puma', '6.4.2'
gem 'nokogiri', '1.16.0'
gem 'actioncable', '7.1.3'
gem 'actionmailbox', '7.1.3'
gem 'actionmailer', '7.1.3'
gem 'actiontext', '7.1.3'
gem 'activestorage', '7.1.3'
gem 'railties', '7.1.3'
gem 'pg_search'
gem 'devise_token_auth', '>= 1.0.0', git: "https://github.com/lynndylanhurley/devise_token_auth"
gem 'rack-cors'
gem 'psych', '3.3.0'
gem 'mailcatcher'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
end

group :test do
  gem 'faker'
  gem 'database_cleaner-active_record'
end

group :development do
  gem "letter_opener"
end
