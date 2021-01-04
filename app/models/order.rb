class Order < ApplicationRecord
  belongs_to :user
  belongs_to :carted_product
  belongs_to :product through: :carted_product
  validates :product_id, presence: true
  validates :quantity, numericality: { greater_than_or_equal_to: 1 }
end
