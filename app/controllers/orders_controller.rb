class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order)
    @reviews = Review.all
    # @orders = policy_scope(Order).where(user: current_user).or(Order.where(dressmaker: current_user))
    # authorize @orders
  end

  def show
    @order = Order.find(params[:id])
    order_confirmation_check(@order) if params[:order_conf]
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
    @order = Order.find(params[:id])
    authorize @order
  end

  def update
    @order = Order.find(params[:id])
    authorize @order

    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to order_messages_path(@order) }

        # save changed details into an array to show them in message notification
        change_details = []
        order_params.each do |key, value|
          change_details << "#{key.capitalize}: #{value}"
        end

        # in response to json request
        format.json {
          # create message notification
          change_noti = Message.new(content:
            "A new change has been made. Please check the details: <br><br> #{change_details.join('<br>')}", order: @order, user: current_user)
          # send response back to js if change is saved and message is sent
          if change_noti.save
            # need to pass in a json format in order to send back to js
            render json: {
              status: 'ok'
            }
          end
        }

      else
        redirect_to order_messages_path(@order)
      end
    end
  end

  private

  def order_params
    params.require(:order).permit(:completion_date, :order_details, :fabric, :status, :payment, :dressmaker_id, :dimension_chest, :dimension_waist, :dimension_hips, :dimension_length, :price, :order_reference, :order_conf)
  end

  def order_reference(order)
    letters = ('A'..'Z').to_a.sample(3).join
    numbers = (1..9).to_a.sample(3).join
    return 'DM' + Time.now.year.to_s + letters + numbers
  end

  def order_confirmation_check(order)
    # when user confirms order
    if current_user.dressmaker == false
      order.update(buyer_confirmation: true)
      confirm_message = Message.new(content: "#{current_user.first_name.capitalize} has just confirmed order details. Please respond within 24 hours.")
      confirm_message.order = @order
      confirm_message.user = @order.user
      confirm_message.save
    # when dressmaker confirms order
    elsif current_user.dressmaker == true
      order.update(dressmaker_confirmation: true)
      confirm_message = Message.new(content: "#{current_user.first_name.capitalize} has just confirmed order details. Please respond within 24 hours.")
      confirm_message.order = @order
      confirm_message.user = @order.dressmaker
      confirm_message.save
    end
    if order.buyer_confirmation && order.dressmaker_confirmation
      order.update(status: "Awaiting Payment")
      # payment_message_link = redirect_to 'click here', order_path(@order)
      payment_message = Message.new(content: "Order confirmed, please view order to proceed with payment.")
      payment_message.order = @order
      payment_message.user = @order.dressmaker
      payment_message.save
    end
  end
end
