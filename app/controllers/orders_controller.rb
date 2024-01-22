class OrdersController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        @orders = Order.all
    end

    def create
    permitted_params = params.require(:order).permit(
      :branch_id,
      :total,
      :username,
      order_items_attributes: [:item_id, :qty, :pric]
    )

    # Filter out order_items_attributes without item_id
    permitted_params[:order_items_attributes]&.reject! { |order_item|order_item[:item_id].blank? }

    if permitted_params[:order_items_attributes].present?
      # Create the order with the modified parameters
      @order = Order.new(permitted_params)
      # to set the total of the order
      total = 0
      if @order.save
            @order.item_ids.each do |item|
            item_details  = BranchItemsController.get_details(@order.branch_id, item)
            order_item_details = OrderItemsController.get_details(@order.id, item)
            total += (order_item_details.pric*order_item_details.qty)
           end
           @order.set_total(total)
           redirect_to "/orders/#{@order.id}", allow_other_host: true
      end
    end
  end


    def show
        @order = Order.find(params[:id])
    end




end
