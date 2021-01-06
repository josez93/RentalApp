class Product < ApplicationRecord
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :users, through: :carted_products
  # has_many :orders
  # has_many :users, through: :orders
  validates :name, presence: true
  validates :inventory, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  #validates :image_url, presence: true

  def tax
    price * 0.10
  end

  def total
    price + tax
  end
end
