require "test_helper"

class BranchItemTest < ActiveSupport::TestCase
  def setup
    @item = Item.new(name: "fries", is_cooke: true, preparationـtime: 5.31)
    @branch = Branch.new(name: "yellow", latitude: "23.989" , longitude:"50.88")
    @item.save
    @branch.save

    @branch_item = BranchItem.new(branch_id: @branch.id,
    item_id: @item.id, price: 10.99, available_qty: 20)
  end

  test "should be vaild" do
    assert @branch_item.valid?
  end

  test "should require a positive price" do
    @branch_item.price = 0
    assert_not @branch_item.valid?
    assert_equal ["must be greater than 0"], @branch_item.errors[:price]
  end

  test "should require a non-negative available_qty" do
    @branch_item.available_qty = -1
    assert_not @branch_item.valid?
    assert_equal ["must be greater than or equal to 0"], @branch_item.errors[:available_qty]
  end

  test "should require unique branch and item combination" do
    duplicate_branch_item = @branch_item.dup
    @branch_item.save
    assert_not duplicate_branch_item.valid?
    assert_equal ["has already been taken"], duplicate_branch_item.errors[:branch_id]
  end
end
