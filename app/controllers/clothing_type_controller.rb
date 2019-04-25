class ClothingTypeController < ApplicationController
  before_action :set_dressmaker

  def create

  end

  private

  def set_dressmaker
    @dressmaker = DressmakerProfile.find(params[:id])
  end
end
