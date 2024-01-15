require "test_helper"
class ItemTest < ActiveSupport::TestCase
  def setup
  @item = Item.new(name: "fries", is_cooke: true, preparationـtime: 5.31)
  end

#to check if there is a model Item
  test "item should be valid" do
    assert @item.valid?
  end


#to check that all attrubuite should have a value
  test "name should be present" do
    @item.name = " "
    assert_not @item.valid?
  end


  test "is_cooke should be present" do
    @item.is_cooke = nil
    assert_not @item.valid?
  end

  test "preparationـtime should be present" do
    @item.preparationـtime = nil
    assert_not @item.valid?
  end


  test "name should be unique" do
    @item.save
    @item2 = Item.new(name: "fries", is_cooke: true, preparationـtime: 5.31)
    assert_not @item2.valid?
  end

  test "name length should not be less than 4" do
    @item.name = "hi"
    assert_not @item.valid?
  end

  test "preparationـtime should be greater than or equal to 0" do
    @item.preparationـtime = -1
    assert_not @item.valid?
  end
end
