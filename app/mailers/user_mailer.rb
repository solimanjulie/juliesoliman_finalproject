class UserMailer < ActionMailer::Base
  default from: 'donotreplyflitter@gmail.com'

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to Flitter')
  end
end
