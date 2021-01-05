class Product < ApplicationRecord
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :users, through: :carted_products
  # has_many :orders
  # has_many :users, through: :orders
  validates :name, presence: true
  validates :inventory, presence: true
  #validates :image_url, presence: true
end
