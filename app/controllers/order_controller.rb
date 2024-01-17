class OrderController < ApplicationController
    def new
        @order = Order.new
    end

    def create
        @order = Order.new(order_params)
        @order.save
    end

    def index 
        @order = Order.all
    end

    def self.get_order
        return @order = Order.find(params[:id])
    end


    private

    def order_params
      params.require(:order).permit(:branch_id, :username, :total)
    end

end
