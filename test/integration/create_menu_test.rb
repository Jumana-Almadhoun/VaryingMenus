require "test_helper"

class CreateMenuTest < ActionDispatch::IntegrationTest
  test "get new menu form and creat menu" do
    get "/menus/new"
    assert_response :success
    assert_difference "Menu.count", 1 do
      post menus_path, params: { menu: { name:"Blue"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Blue", response.body
  end


  # test "get new menu form and reject invalid menu submission" do
  #   get "/menus/new"
  #   assert_response :success
  #   assert_no_difference 'Menu.count' do
  #     post categories_path, params: { menu: { name: " "} }
  #   end
  #   assert_match "errors", response.body
  #   assert_select 'div.alert'
  #   assert_select 'h4.alert-heading'
  # end

end
