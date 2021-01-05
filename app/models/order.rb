class Order < ApplicationRecord
  belongs_to :user
  # belongs_to :carted_product
  has_many :carted_products
  has_many :products, through: :carted_products
  validates :product_id, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
end
