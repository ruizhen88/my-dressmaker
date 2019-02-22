class BuyerProfilesController < ApplicationController

  def show
    @user = current_user
  end

  def edit

  end

  def update
    @user = current_user
    @user.update
  end
end
