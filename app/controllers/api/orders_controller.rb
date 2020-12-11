class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = Order.all
    render "index.json.jb"
  end

  def create
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
    )
    if @order.save
      render json: { message: "order created" }, status: :created
    else
      render json: { errors: @order.errors.full_message }, status: :bad_request
    end
  end

  def show
    @order = Order.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @order = Order.find_by(id: params[:id])

    @order.product_id = params[:product_id] || @order.product_id
    @order.quantity = params[:quantity] || @order.quantity
    @order.save
    render "show.json.jb"
  end

  def destroy
    @order = Order.find_by(id: params[:id])
    @order.destroy
    render json: { message: "order is destroyed" }
  end
end
