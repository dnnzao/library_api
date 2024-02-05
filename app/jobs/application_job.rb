#
#Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/jobs/application_job.rb
#Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/jobs
#Created Date: Thursday, February 1st 2024, 4:02:58 pm
#Author: Dênio Barbosa Júnior
#
#Copyright (c) 2024 Your Company
#


class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError
end
