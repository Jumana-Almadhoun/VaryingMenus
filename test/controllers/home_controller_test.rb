require "test_helper"

class HomeControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:latitude)
      assert_not_nil assigns(:longitude)
    end
end
