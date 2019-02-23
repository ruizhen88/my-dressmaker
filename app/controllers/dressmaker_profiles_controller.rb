class DressmakerProfilesController < ApplicationController
  before_action :set_dressmaker, only: %i[show edit update]

  def index
    # dressmakers = policy_scope(DressmakerProfile).order(created_at: :desc) eventually order by review ratings?
    @users = User.where(dressmaker: true)

    @dressmakers = policy_scope(DressmakerProfile)
    # @dressmakers = DressmakerProfile.all
  end

  def show
    @dressmaker = current_user
    authorize @dressmaker
  end

  # def new
  #   @dressmaker = DressmakerProfile.new
  #   authorize @dressmaker
  # end

  # def create
  #   @dressmaker = DressmakerProfile.new(dressmaker_params)
  #   authorize @dressmaker
  #   if @dressmaker.save
  #     redirect_to dressmaker_profile_path(@dressmaker)
  #   else
  #     render 'new'
  #   end
  # end

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
