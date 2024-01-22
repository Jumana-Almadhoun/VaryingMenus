class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :item

    validates :item_id, presence: true
    validates :pric, presence: true
    validates :qty, presence: true , numericality:{greater_than: 0}
end
