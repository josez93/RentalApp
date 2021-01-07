class AddDateToCartedProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :carted_products, :booking_date, :integer
  end
end
