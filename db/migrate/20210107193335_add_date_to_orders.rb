class AddDateToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :booking_date, :integer
  end
end
