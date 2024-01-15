require "test_helper"

class ListMenuTest < ActionDispatch::IntegrationTest
  def setup
    @menu = Menu.create(name: "Yellow")
    @menu2 = Menu.create(name: "Reed")
  end

  test "should show menues listing" do
    get '/menus'
    assert_select "a[href=?]", menu_path(@menu), text: @menu.name
    assert_select "a[href=?]", menu_path(@menu2), text: @menu2.name
  end
end
