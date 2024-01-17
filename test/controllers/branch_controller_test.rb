require "test_helper"

class BranchControllerTest < ActionDispatch::IntegrationTest
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
    
end
