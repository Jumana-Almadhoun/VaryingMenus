require "test_helper"

class BranchesControllerTest < ActionDispatch::IntegrationTest
    def setup
        @branch = Branch.create(
            name: "Rawda",
            latitude: 40.7128,
            longitude: -74.0060
        )
        @branch.save
    end

    test "should get index" do
        get '/branch'
        assert_response :success
    end

    test "should show branch" do
        get branch_url(@branch)
        assert_response :success
    end

    # test/controllers/branches_controller_test.rb

  test 'should get test_haversine_distance' do
    # Create some sample data
    user_latitude = 37.7749
    user_longitude = -122.4194

    branch1 = Branch.create(name: 'Branch 1', latitude: 37.7749, longitude: -122.4194)
    branch2 = Branch.create(name: 'Branch 2', latitude: 37.7550, longitude: -122.4056)
    branch1.save
    branch2.save

    # Call the haversine_distance method
    result = BranchController.haversine_distance(user_latitude, user_longitude)
    assert_not_nil result
  end



end
