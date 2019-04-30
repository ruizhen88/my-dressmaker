class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home inspo landing-eng]

  def home
    @messages = Message.where(read: false)
  end

  def redirect_after_signup
    :buyer_profile_path
  end

  def inbox
    @orders = Order.where(user: current_user).or(Order.where(dressmaker: current_user))
  end

  def inspo
    @photos = Photo.all

    render template: "pages/inspiration"
  end

end
