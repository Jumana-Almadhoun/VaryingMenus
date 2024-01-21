class OrderItem < ApplicationRecord
    belongs_to :item
    belongs_to :order

    def set_price(price)
        self.pric = price
        save
    end

    def set_qty(qty)
        self.qty = qty
        save
    end
end
