class OrderItemsController < ApplicationController
    def new
        @order_items = OrderItems.new
    end

    def create 
        @order_items = Order.new(order_params)
        @order_items.save
    end
end
