class Product < ApplicationRecord
  validates :name, :description, :price, presence: true
  has_many :images, as: :imageable, dependent: :destroy
  belongs_to :shop
end
