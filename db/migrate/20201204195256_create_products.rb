class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :inventory
      t.string :image_url

      t.timestamps
    end
  end
end
