class ChangeBookingDateToDateFromCartedProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :carted_products, :booking_date, :string
    add_column :carted_products, :booking_date, :date
  end
end
