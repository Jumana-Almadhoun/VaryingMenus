require "test_helper"


class OrderTest < ActiveSupport::TestCase

    def setup
      @branch = Branch.new(
        name: "Rawda",
        latitude: 40.7128,
        longitude: -74.0060
      )
      @branch.save
      @order = Order.new(
        username: 'Jumana5',
        branch_id: @branch.id,
        total: 50.00
      )
    end
    test 'should be valid' do
      assert @order.valid?
    end
  
    test 'username should be present and at least 4 characters' do
      @order.username = "aa"
      assert_not @order.valid?
      assert_includes @order.errors[:username], 'is too short (minimum is 4 characters)'
  
      @order.username = nil 
      assert_not @order.valid?
      assert_includes @order.errors[:username], "can't be blank"
    end
  
    test 'branch_id should be present' do
      @order.branch_id = nil
      assert_not @order.valid?
    end
  
    test 'total should be present and greater than 0' do
      @order.total = 0
      assert_not @order.valid?
      assert_includes @order.errors[:total], 'must be greater than 0'
  
      @order.total = nil
      assert_not @order.valid?
      assert_includes @order.errors[:total], "can't be blank"
    end
  
  
end
