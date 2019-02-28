class ReviewsController < ApplicationController
  before_action :set_order

  def new
    @review = Review.new
    skip_authorization
  end

  def create
    @review = Review.new(review_params)
    @review.order = @order
    skip_authorization
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
