class PortfoliosController < ApplicationController
  before_action :set_dressmaker

  def create
    add_more_images(portfolios_params[:portfolios])
    flash[:error] = "Failed uploading images" unless @dressmaker.save
    redirect_to :back
  end

  def destroy
    remove_image_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting image" unless @dressmaker.save
    redirect_to :back
  end

  private

  def set_dressmaker
    @dressmaker = DressmakerProfile.find(params[:dressmaker_profile_id])
  end

  def add_more_images(new_images)
    portfolios = @dressmaker.portfolios
    portfolios += new_images
    @dressmaker.portfolios = portfolios
  end

  def remove_image_at_index(index)
    remain_images = @dressmaker.portfolios
    remain_images.destroy(index)
    @dressmaker.portfolios = remain_images
  end

  def portfolios_params
    params.require(:dressmaker_profile).permit({portfolios: []})
  end
end
