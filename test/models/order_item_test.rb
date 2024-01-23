# test/models/order_item_test.rb

require 'test_helper'
class OrderItemTest < ActiveSupport::TestCase


  def setup
   @item = Item.new(name: "fries",
   is_cooke: true, preparationـtime: 5.31)
   @item.save

   @order = Order.new(username: 'Jumana5',
    branch_id: 1, total: 50.00)
   @order.save

   @order_item = OrderItem.new(item_id: @item.id,
   pric: 10.0, qty: 3, order_id: @order.id)

  end



  test 'should not save order item without item_id' do
    @order_item.item_id = nil
    assert_not @order_item.valid?
  end

  test "should not save order item without pric" do
    @order_item.pric = nil
    assert_not @order_item.valid?
  end

  test "should not save order item without qty" do
    @order_item.qty = nil
    assert_not @order_item.valid?
  end

  test "should not save order item without order_id" do
    @order_item.order_id = nil
    assert_not @order_item.valid?
  end

end
