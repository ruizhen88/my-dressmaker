# Preview all emails at http://localhost:3000/rails/mailers/user_mailer



class UserMailerPreview < ActionMailer::Preview
  def welcome_dm
    user = User.first
    UserMailer.welcome_dm(user)
  end

  def welcome_buyer
    user = User.first
    UserMailer.welcome_buyer(user)
  end


end
# Preview this email at http://localhost:3000/rails/mailers/user_mailer/welcome
