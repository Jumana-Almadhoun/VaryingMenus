class Item < ApplicationRecord
  has_many  :order_items
  has_many  :order, through: :order_items
  has_many  :branch_items
  has_many  :branches, through: :branch_items
  validates :name, presence: true,  uniqueness: { case_sensitive: false },length: { minimum: 4}
  validates :is_cooke, presence: true
  validates :preparationـtime, presence: true, numericality: { greater_than_or_equal_to: 0}
end
