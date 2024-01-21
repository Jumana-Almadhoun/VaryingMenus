class OrdersController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        @orders = Order.all
    end


    def create
        @order = Order.new(order_params)
        total = 0
        if @order.save
           @order.item_ids.each do |item|
            item_details  = BranchItemsController.get_details(@order.branch_id, item)
            @order_item_details = OrderItemsController.get_details(@order.id, item)
            @order_item_details.set_price(item_details.price)
            total += item_details.price
           end
           @order.set_total(total)
           redirect_to @order  # Make sure the order has an ID assigned
        end
    end

    def show
        @order = Order.find(params[:id])
    end


    def destroy
        @order = Order.find(params[:id])
        if @order.destroy
          redirect_to order_path
        end
    end


    private
    def order_params
        params.require(:order).permit(:branch_id, :username, :total, item_ids: [],
        order_items_attributes: [:item_id, :qty, :pric])
    end



end
