# frozen_string_literal: true

#
# Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/spec/support/database_cleaner.rb
# Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/spec/support
# Created Date: Wednesday, February 21st 2024, 5:01:55 pm
# Author: Dênio Barbosa Júnior
#
# Copyright (c) 2024 Your Company
#

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
