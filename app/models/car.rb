class Car < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user

  has_many :reservations, dependent: :destroy
  has_many :users, through: :reservations

  has_many_attached :photos
  validates :year, presence: true
  validates :model, presence: true
  validates :brand, presence: true
  validates :price, presence: true
  validates :address, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_brand_and_model,
    against: [ :brand, :model ],
    using: {
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }

end
