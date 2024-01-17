class Branch < ApplicationRecord
  has_many :branch_items
  has_many :items, through: :branch_items
  has_many :orders
  validates :name, presence: true, uniqueness: { case_sensitive: false },length: { minimum: 4}
  validates :latitude, presence: true, numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, presence: true, numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates_uniqueness_of :latitude, scope: :longitude
end
