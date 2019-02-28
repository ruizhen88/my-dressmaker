class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #

  def welcome_dm(user)

    @user = user # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to My Dressmaker')
    # This will render a view in `app/views/user_mailer`!
  end

  def welcome_buyer(user)

    @user = user # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to My Dressmaker')
    # This will render a view in `app/views/user_mailer`!
  end

  def buyer_order_validation(email, order)
    @email = email
    @order = order
    mail(to: @email, subject: " Order #{order.status}")
  end

  def dm_order_validation(email, order)
    @email = email
    @order = order
    mail(to: @email, subject: " Order #{order.status}")
  end
end
