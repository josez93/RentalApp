class User < ApplicationRecord
  has_secure_password
  has_many :orders
  has_many :products, through: :orders

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :street_address, presence: true
  validates :phone_number, presence: true, uniqueness: true
end
