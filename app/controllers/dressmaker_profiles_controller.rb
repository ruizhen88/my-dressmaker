class DressmakerProfilesController < ApplicationController
  before_action :set_dressmaker, only: %i[show edit update]

  def index
    @dressmakers = DressmakerProfile.all
  end

  def show
    @dressmaker = current_user
  end

  def new
    @dressmaker = DressmakerProfile.new
  end

  def create
    @dressmaker = DressmakerProfile.new(dressmaker_params)

    if @dressmaker.save
      redirect_to dressmaker_profile_path(@dressmaker)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @dressmaker.save
      redirect_to dressmaker_profile_path(@dressmaker)
    else
      render 'edit'
    end
  end

  def destroy
    # to be confirmed
  end

  private

  def dressmaker_params
    params.require(:dressmaker).permit(:bio, :fb_url, :inst_url)
  end

  def set_dressmaker
    @dressmaker = current_user
  end
end
