class DressmakerProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_dressmaker, only: %i[show edit update]

  def index
    # dressmakers = policy_scope(DressmakerProfile).order(created_at: :desc) eventually order by review ratings?
    @dressmakers = policy_scope(DressmakerProfile)
    # @dressmakers = DressmakerProfile.all
  end

  def show
    @dressmaker = current_user
    authorize @dressmaker
  end

  def edit
    authorize @dressmaker
  end

  def update
    authorize @dressmaker
    if @dressmaker.update(dressmaker_params)
      redirect_to dressmaker_profile_path

    else
      render 'edit'
    end
  end

  def destroy
    # to be confirmed
  end

  private

  def dressmaker_params
    params.require(:dressmaker_profile).permit(:bio, :fb_url, :insta_url)
  end

  def set_dressmaker
    @dressmaker = DressmakerProfile.find(params[:id])
  end
end
