# frozen_string_literal: true

#
# Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/config/environment.rb
# Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/config
# Created Date: Thursday, February 1st 2024, 4:02:58 pm
# Author: Dênio Barbosa Júnior
#
# Copyright (c) 2024 Your Company
#

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Rails.logger = Logger.new(STDOUT)
# config.logger = ActiveSupport::Logger.new("log/#{Rails.env}.log")
# Rails.logger.level = Logger::DEBUG
# Rails.logger.datetime_format = "%Y-%m-%d %H:%M:%S"

# # log formatter
# logger.formatter = proc do | severity, time, progname, msg | 
#   "#{datetime}, #{severity}: #{msg} from #{progname} \n"
# end