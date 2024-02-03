require "test_helper"

class ItemsControllerTest < ActionController::TestCase
  def setup
    @item = Item.new(name: "corn", is_cooked: true, preparationـtime: 10.2)

  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
