class Order < ApplicationRecord
    has_many :order_items, dependent: :delete_all
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

    def self.active
        where(status:'active')
    end

    def self.archived
        where(status: 'archived')
    end

    def active?
        status == "active"
    end

    def archived?
        status == "archived"
    end
end
