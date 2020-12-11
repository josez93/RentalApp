class Product < ApplicationRecord
  has_many :orders
  has_many :users, through: :orders
  validates :name, presence: true
  validates :inventory, presence: true
  #validates :image_url, presence: true
end
