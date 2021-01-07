class RemoveBookingDateFromOrders < ActiveRecord::Migration[6.0]
  def change
    remove_column :orders, :booking_date, :integer
  end
end
