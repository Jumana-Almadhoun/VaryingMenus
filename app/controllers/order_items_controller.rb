class OrderItemsController < ApplicationController
    def new
        @order_items = OrderItems.new
    end

    def create
        @order_items = Order.new(order_params)
        @order_items.save
    end

    def update

    end

    def self.get_details(order_id, item_id)
        @order_item = OrderItem.find_by(order_id: order_id, item_id: item_id)
        return @order_item
    end




    private
    def order_item_params
        params.require(:order_items).permit(:item_id, :order_id, :pric, :qty)
    end




end
