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
        get '/branches'
        assert_response :success
    end

    test "should show branch" do
        get branch_url(@branch)
        assert_response :success
    end

    # test/controllers/branches_controller_test.rb


    test 'should get nearest branch' do
        @branch1 = branches(:branch1)
        @branch2 = branches(:branch2)
        get "/branches#nearest", params: { lat1: 37.7749, lon1: -122.4194 }
        assert_response :success
    end



end
