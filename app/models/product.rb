class Product < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4, maximum: 20 }
  validates :description, presence: true, length: { minimum: 4, maximum: 60 }
  validates :price, numericality: { greater_than: 1000, less_than_or_equal_to: 999_999, only_integer: true }

  validates :category, presence: true
  validates :user, presence: true

  belongs_to :user
  belongs_to :category
end
