class Product < ApplicationRecord
  validates :name, presence: true, length: { minimum: 4, maximum: 20 }
  validates :description, presence: true, length: { minimum: 4, maximum: 60 }
  validates :price, numericality: { greater_than: 900 }
  validates :category, presence: true
  validates :user, presence: true

  belongs_to :user
  belongs_to :category
end
