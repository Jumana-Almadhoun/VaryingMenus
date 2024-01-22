require 'test_helper'

class OrderItemsControllerTest < ActionController::TestCase

  def setup
    @branch = Branch.new(name: "yellow", latitude: "23.989" , longitude:"50.88")
    @branch.save
    @item = Item.new(name: "fries",
    is_cooke: true, preparationـtime: 5.31)
    @item.save

    @order = Order.new(username: 'Jumana5',
     branch_id: @branch.id, total: 50.00)
    @order.save

    @order_item = OrderItem.new(item_id: @item.id,
    pric: 10.0, qty: 3, order_id: @order.id)
    @order_item.save
  end

  test "should get details" do
    order_id = @order.id
    item_id = @item.id
    result = OrderItemsController.get_details(order_id, item_id)
    assert_not_nil result
  end
end
