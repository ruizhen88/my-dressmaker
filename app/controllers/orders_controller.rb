class OrdersController < ApplicationController

  def index
    @orders = policy_scope(Order)
    # @orders = policy_scope(Order).where(user: current_user).or(Order.where(dressmaker: current_user))
    # authorize @orders
  end


  def show
    @order = Order.find(params[:id])
    authorize @order
  end

  def new
    @order = Order.new
    authorize @order
    @fabrics = ["Linen", "Cotton", "Silk"]
    # @order.user = current_user
    # @order.dressmaker = DressmakerProfile.find(params[:dressmaker_id]).user
    # @order.dressmaker_id = DressmakerProfile.find(params[:dressmaker_id])
    # @order.dressmaker = DressmakerProfile.find(params[:id])
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @order.dressmaker = DressmakerProfile.find(session[:dressmaker_id]).user
    @order.status = "Pending"
    @order.order_reference = order_reference(@order)
    @order.buyer_confirmation = false
    @order.dressmaker_confirmation = false
    authorize @order

    if @order.save
      first_message = Message.new(content: "Hi #{@order.dressmaker.first_name}, please check my request!")
      first_message.order = @order
      first_message.user = @order.user
      first_message.save

      redirect_to order_messages_path(@order)
    else
      render :new
    end
    # @order.dressmaker_id = DressmakerProfile.find(params[:dressmaker_id])
  end

  def edit

  end

  def update

  end

  private

  def order_params
    params.require(:order).permit(:price, :completion_date, :quantity, :order_details, :status, :payment, :dressmaker_id, :dimension_chest, :dimension_waist, :dimension_hips, :dimension_length, :fabric, :order_reference)
  end

  def order_reference(order)
    letters = ('A'..'Z').to_a.sample(3).join
    numbers = (1..9).to_a.sample(3).join
    return 'DM' + Time.now.year.to_s + letters + numbers
  end
end
