require 'test_helper'

class MenuTest < ActiveSupport::TestCase

  def setup
    @menu = Menu.new(name: "Yellow")
  end

  test "menu should be valid" do
    assert @menu.valid?
  end

  test "name should be present" do
    @menu.name = " "
    assert_not @menu.valid?
  end

  test "name should be unique" do
    @menu.save
    @menu2 = Menu.new(name: "Yellow")
    assert_not @menu2.valid?
  end

  test "name length should not be less than 4" do
    @menu.name = "hi"
    assert_not @menu.valid?
  end
end
