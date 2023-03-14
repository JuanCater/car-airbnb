class Car < ApplicationRecord
  belongs_to :user

  # has_many :reservations
  # has_many :users, through: :reservations

  has_many_attached :photos
  validates :year, presence: true
  validates :model, presence: true
  validates :brand, presence: true
end
