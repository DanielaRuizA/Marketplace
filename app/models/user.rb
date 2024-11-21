class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :products, dependent: :destroy

  validates :name, presence: { message: "Can't be blank" },
  length: { minimum: 2, maximum: 50, message: "Must be between 2 and 50 characters" }
validates :address, presence: { message: "Can't be blank" },
  length: { minimum: 5, maximum: 100, message: "Must be between 5 and 100 characters" }
validates :phone, presence: { message: "Can't be blank" },
  length: { minimum: 9, maximum: 15, message: "Must be between 9 and 15 digits" }
end
