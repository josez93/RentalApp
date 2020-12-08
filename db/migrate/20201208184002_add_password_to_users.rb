class AddPasswordToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password, :string
    rename_column :users, :Street_address, :street_address
  end
end
