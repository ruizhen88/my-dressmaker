class BuyerProfilesController < ApplicationController

  def show
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    @user.update
    authorize @user
  end
end
