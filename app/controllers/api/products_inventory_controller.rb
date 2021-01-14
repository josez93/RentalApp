class Api::ProductsInventoryController < ApplicationController

  def show
    @total = 0
    @product_day_inventory = CartedProduct.where(status: "Rented", booking_date: params[:booking_date], product_id: params[:product_id])
    @product_day_inventory.map do |product|
      @total += product.quantity
    end

    render "show.json.jb"
    # available_product_inventory = total_product_inventory - rented_product_inventory
  end
end
