class Product < ApplicationRecord
  belongs_to :category

  validates :name, :brand, presence: true
  validates :price, numericality: true
  paginates_per 8
end
