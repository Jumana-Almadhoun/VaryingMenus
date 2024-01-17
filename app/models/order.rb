class Order < ApplicationRecord
    has_many :order_items
    has_many :items, through: :order_items
    belongs_to :branch
    validates :username, presence: true,length: { minimum: 4}
    validates :branch_id, presence: true
    validates :total, presence: true, numericality:{greater_than: 0}
end