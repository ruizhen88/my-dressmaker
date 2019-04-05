class ReviewsController < ApplicationController
  before_action :set_order

  def new
    # authorize @review
    @review = Review.new
    @review.order = @order
    skip_authorization
  end

  def create
    # authorize @review
    @review = Review.new(review_params)
    @review.order = @order
    @review.save
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
