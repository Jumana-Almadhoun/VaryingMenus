class Order < ApplicationRecord
    has_many :order_items, dependent: :destroy
    has_many :items, through: :order_items
    belongs_to :branch
    accepts_nested_attributes_for :order_items
    validates :username, presence: true,length: { minimum: 4}
    validates :branch_id, presence: true
    validates :total, presence: true, numericality:{greater_than: 0}


    def set_total(total)
        self.total = total
        save
    end
end
