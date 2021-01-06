class Order < ApplicationRecord
  belongs_to :user
  # belongs_to :carted_product
  has_many :carted_products
  has_many :products, through: :carted_products
  validates :user_id, presence: true

  def update_totals
    calculated_subtotal = 0
    carted_products.each do |carted_product|
      calculated_subtotal += carted_product.quantity * carted_product.product.price
    end

    calculated_tax = calculated_subtotal * 0.10
    calculated_total = calculated_subtotal + calculated_tax

    self.subtotal = calculated_subtotal
    self.tax = calculated_tax
    self.total = calculated_total
    self.save
  end
end
