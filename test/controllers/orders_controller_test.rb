require 'test_helper'

class OrdersControllerTest < ActionController::TestCase


  def setup

    @branch = Branch.new(name: "yellow", latitude: "23.989" , longitude:"50.88")
    @branch.save


    @item = Item.create(name: "fries",
    is_cooke: true, preparationـtime: 5.31)
    @item.save

    @order = Order.create(username: 'Jumana5',
     branch_id: @branch.id, total: 50.00)
    @order.save

    @order_item = OrderItem.new(item_id: @item.id,
    pric: 10.0, qty: 3, order_id: @order.id)
  end
  test "should get index" do
    get :index
    assert_response :success
  end



  test "should create order" do
    assert_difference('Order.count', 1) do
      post :create, params: {
        order: {
          branch_id: @branch.id,
          total: 100,
          username: 'test_user',
          order_items_attributes: [{ item_id: @item.id, qty: 2, pric: 50 }]
        }
      }
    end

    assert_redirected_to order_path(Order.last)
  end

  test "should show order" do
    order = orders(:one)
    get :show, params: { id: order.id }
    assert_response :success
    assert_equal order, assigns(:order)
  end
end
