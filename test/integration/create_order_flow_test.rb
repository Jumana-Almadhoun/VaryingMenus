require "test_helper"

class CreateOrderFlowTest < ActionDispatch::IntegrationTest

def setup
  @branch = Branch.new(
    name: "Rawda",
    latitude: 40.7128,
    longitude: -74.0060
  )
  @branch.save

  @item = Item.new(name: "fries",
  is_cooke: true,
  preparationـtime: 5.31)

  @item.save
end

test "get new order form and create order" do
  get "/branches/#{@branch.id}"
  assert_response :success
  assert_difference 'Order.count', 1 do
    post orders_path, params: {order: {
      branch_id:@branch.id,
      username:"jumana",
      total:50.0,
      order_items_attributes: [{ item_id: @item.id, qty: 2, pric: 50 }]
      } }
  assert_response :redirect
  end
  follow_redirect!
  assert_response :success
  assert_match "1", response.body
end

end
