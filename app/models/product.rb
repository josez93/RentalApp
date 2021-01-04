class Product < ApplicationRecord
  has_many :carted_product
  has_many :order through: :carted_product
  has_many :user through: :carted_product
  # has_many :orders
  # has_many :users, through: :orders
  validates :name, presence: true
  validates :inventory, presence: true
  #validates :image_url, presence: true
end
