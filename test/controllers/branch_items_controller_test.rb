require "test_helper"

class BranchItemsControllerTest < ActionDispatch::IntegrationTest
  def setup
     @item = Item.new(name: "fries", is_cooked: true, preparationـtime: 5.31)
     @branch = Branch.new(name: "yellow", latitude: "23.989" , longitude:"50.88")
     @item.save
     @branch.save
     @branch_item = BranchItem.new(branch_id: @branch.id,
     item_id: @item.id, price: 10.99, available_qty: 20)
     @branch_item.save
  end

  test "should get details" do
    branch_id = @branch.id
    item_id = @item.id
    result = BranchItemController.get_details(branch_id, item_id)
    assert_not_nil result
  end

end
