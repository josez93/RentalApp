class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render "index.json.jb"
  end

  def create
    carted_products = current_user.carted_products.where(status: "carted")

    @order = Order.new(
      user_id: current_user.id,
    )
    @order.save
    carted_products.update_all(status: "Rented", order_id: @orde.id)
    @order.update_totals
    render "show.json.jb"
  end

  def show
    @order = Order.find_by(id: params[:id])
    if order.user_id == current_user.id
      render "_order.json.jb"
    else
      render json: { message: "Not Authorized!!" }
    end
  end

  def update
    @order = Order.find_by(id: params[:id])

    @order.product_id = params[:product_id] || @order.product_id
    @order.quantity = params[:quantity] || @order.quantity
    @order.save
    render "_order.json.jb"
  end

  def destroy
    @order = Order.find_by(id: params[:id])
    @order.destroy
    render json: { message: "order is destroyed" }
  end
end
