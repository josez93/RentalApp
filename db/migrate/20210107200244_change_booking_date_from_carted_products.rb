class ChangeBookingDateFromCartedProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :carted_products, :booking_date, :string
  end
end
