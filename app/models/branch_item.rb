class BranchItem < ApplicationRecord
  belongs_to :branch
  belongs_to :item
  validates :branch_id, presence: true
  validates :item_id, presence: true
  validates_uniqueness_of :branch_id, scope: :item_id
  validates :price, presence: true, numericality:{greater_than: 0}
  validates :available_qty, presence: true, numericality: {greater_than_or_equal_to: 0}
end
