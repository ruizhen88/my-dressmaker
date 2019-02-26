class PaymentsController < ApplicationController
  before_action :set_order

  def new
    skip_authorization
  end

  def create
    skip_authorization
    customer = Stripe::Customer.create(
      source: params[:stripeToken],
      email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
      customer:     customer.id,
      amount:       @order.price_cents,
      description:  "Payment for dress",
      currency:     @order.price.currency
    )

    @order.update(payment: charge.to_json, status: 'paid')
    redirect_to order_path(@order)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_order_payment_path(@order)
  end

  private

  def set_order
    @order = current_user.orders.where(status: 'Pending').find(params[:order_id])
  end
end
