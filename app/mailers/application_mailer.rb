class ApplicationMailer < ActionMailer::Base
  default from: 'deniojr@gmail.com'

  def sample_email
    mail(to: 'deniojr@gmail.com', subject: 'Test Email')
  end

  def confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Confirmation Email')
  end
end
