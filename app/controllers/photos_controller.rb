class PhotosController < ApplicationController
  before_action :set_dressmaker

  def new
    @photo = Photo.new(dressmaker_profile: @dressmaker)
    authorize @photo
  end

  def create
    @photo = Photo.new(dressmaker_profile: @dressmaker)
    @photo.dressmaker_profile = @dressmaker
    authorize @photo
    redirect_to dressmaker_profile_path(@dressmaker) if @photo.save
  end

  def destroy
    @photo = Photo.find(params[:id])
    authorize @photo

    if @photo.destroy
      respond_to do |format|
        format.html { redirect_to dressmaker_profile_path(@dressmaker), notice: "Image successfully deleted!" }
        format.json { head :no_content }
        format.js
      end
    else
      flash[:error] = "Failed deleting image"
      redirect_to dressmaker_profile_path(@dressmaker)
    end

  end

  private

  def set_dressmaker
    @dressmaker = DressmakerProfile.find(params[:dressmaker_profile_id])
  end
end
