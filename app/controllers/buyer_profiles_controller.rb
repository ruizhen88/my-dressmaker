class BuyerProfilesController < ApplicationController
  def show
    @buyer = BuyerProfile.find(params[:id])
    authorize @buyer
  end

  def new
    @buyer = BuyerProfile.new
    authorize @buyer
  end

  def create
    @buyer = BuyerProfile.new(buyer_params)

    if @buyer.update
      redirect_to buyer_profile_path(new_buyer)
    else
      render 'new'
    end
  end

  def edit
    set_buyer
    authorize @buyer
  end

  def update
    set_buyer
    authorize @buyer
    if @buyer.update(buyer_params)
      redirect_to buyer_profile_path

    else
      render 'edit'
    end
  end

  private

  def buyer_params
    params.require(:buyer_profile).permit(:size, :style)
  end

  def set_buyer
    @buyer = BuyerProfile.find(params[:id])
  end
end
