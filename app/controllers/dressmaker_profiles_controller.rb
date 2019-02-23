class DressmakerProfilesController < ApplicationController
  before_action :set_dressmaker, only: %i[show edit update]

  def index
    if params[:query].present?
      @dressmakers = policy_scope(DressmakerProfile).global_search(params[:query])
    else
      @dressmakers = policy_scope(DressmakerProfile)
    end
  end

  def show
    @dressmaker = current_user
    authorize @dressmaker
  end

  def new
    @dressmaker = DressmakerProfile.new
    authorize @dressmaker
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
