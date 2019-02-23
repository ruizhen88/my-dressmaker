class DressmakerProfilesController < ApplicationController
  before_action :set_dressmaker, only: %i[show edit update]

  def index
    # dressmakers = policy_scope(DressmakerProfile).order(created_at: :desc) eventually order by review ratings?

    @dressmakers = policy_scope(DressmakerProfile)
    # @dressmakers = DressmakerProfile.all

    @dressmakers_users = User.where.not(latitude: nil, longitude: nil) && User.where(dressmaker: true)

    @markers = @dressmakers_users.map do |user|
      {
        lng: user.longitude,
        lat: user.latitude
      }
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
    @dressmaker = DressmakerProfile.find(params[:id])
  end
end
