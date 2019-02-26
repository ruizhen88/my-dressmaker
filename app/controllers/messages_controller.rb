class MessagesController < ApplicationController
  # after_action :skip_pundit?
  after_action :verify_authorized
  before_action do
    @order = Order.find(params[:order_id])
  end

  def index
    # Message Policy only allows those related to the order can access the page,
    @messages = policy_scope(Message)
    # no need to specify either sender or recipient
    # current user should always be a sender of the instance
    # recipient will always be the other one linked to the order

    # if current_user.dressmaker, recipient is the order's customer (@order.user)
    # if current user is a customer, recipient is the order's dm (@order.dressmaker)

    # display a new form on index page
    @message = Message.new

    authorize @messages
  end

  def new
    @message = Message.new
    authorize @message
  end

  def create
    # assign sender as user_id when a new message is created
    @message = Message.new(message_params)
    @message.user = current_user
    @message.order = @order

    redirect_to order_messages_path if @message.save
    authorize @message
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end
