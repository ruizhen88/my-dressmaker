class DressmakerProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_dressmaker, only: %i[show edit update]

  def index
    # for dropdown filter
    @specialities = Speciality.all

    if params[:query].present?
      @dressmakers = policy_scope(DressmakerProfile).global_search(params[:query])
      @dressmakers_users = @dressmakers.collect(&:user)
      pin_markers(@dressmakers_users)
    else
      @dressmakers = policy_scope(DressmakerProfile)
      @dressmakers_users = @dressmakers.collect(&:user)
      pin_markers(@dressmakers_users)
    end

    if params[:dressmaker_profile].present? && params[:dressmaker_profile][:speciality_name].present?
      @dressmakers = @dressmakers.global_search(params[:dressmaker_profile][:speciality_name])
      @dressmakers_users = @dressmakers.collect(&:user)
      pin_markers(@dressmakers_users)
    end
    # dressmakers = policy_scope(DressmakerProfile).order(created_at: :desc) eventually order by review ratings?
    # @dressmakers = DressmakerProfile.all
  end


  def show
    session[:dressmaker_id] = params[:id]
    @order = Order.new
    @reviews = Review.all
    @fabrics = ["Linen", "Cotton", "Silk"]
    skip_authorization
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

  def pin_markers(users)
    @dressmakers_users = []
    users.each do |user|
      @dressmakers_users << user if user.latitude.present? && user.longitude.present?
    end
    @dressmakers_users
    @markers = @dressmakers_users.map do |user|
      {
        lng: user.longitude,
        lat: user.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { user: user })
      }
    end
  end

  def dressmaker_params
    params.require(:dressmaker_profile).permit(:bio, :fb_url, :insta_url)
  end

  def set_dressmaker
    @dressmaker = DressmakerProfile.find(params[:id])
  end
end
