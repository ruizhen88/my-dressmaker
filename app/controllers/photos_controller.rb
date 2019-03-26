class PhotosController < ApplicationController
  before_action :set_dressmaker

  def new
    @photo = Photo.new(dressmaker_profile: @dressmaker)
  end

  def create
    @photo = Photo.new(dressmaker_profile: @dressmaker)
    @photo.dressmaker_profile = @dressmaker

    redirect_to dressmaker_profile_path(@dressmaker) if @photo.save
  end

  def destroy
    # flash[:error] = "Failed deleting image" unless @photo.save
    # redirect_to :back
  end

  private

  def set_dressmaker
    @dressmaker = DressmakerProfile.find(params[:dressmaker_profile_id])
  end
end
