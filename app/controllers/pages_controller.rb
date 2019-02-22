class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def redirect_after_signup
    :buyer_profile_path
  end
end
