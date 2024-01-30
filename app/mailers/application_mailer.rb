class ApplicationMailer < ActionMailer::Base
  default from: 'deniojr@gmail.com' # replace with your email

  def sample_email
    mail(to: 'deniojr@gmail.com', subject: 'Test Email')
  end
end
