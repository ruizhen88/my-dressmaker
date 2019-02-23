class BuyerProfilesController < ApplicationController
  def show
    @buyer = BuyerProfile.find(params[:id])
    authorize @buyer
  end

  def update
    @user = current_user
    @user.update
    authorize @user
  end

  def new
    @buyer = BuyerProfile.new
    authorize @buyer
  end

  def create
    @buyer = BuyerProfile.new#(buyer_params)

    if @buyer.save
      redirect_to buyer_profile_path(new_buyer)
    else
      render 'new'
    end
  end

  private

  def buyer_params
    params.require(:buyer).permit(:size, :style)
  end

  def set_buyer
    @buyer = current_user
  end
end
