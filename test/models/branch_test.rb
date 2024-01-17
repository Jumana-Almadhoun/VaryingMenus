# test/models/branch_test.rb

require 'test_helper'

class BranchTest < ActiveSupport::TestCase

  def setup
  @branch = Branch.new(
        name: "Rawda",
        latitude: 40.7128,
        longitude: -74.0060
      )
  end
  test "should be valid with valid attributes" do
    assert @branch.valid?, "Branch is not valid with valid attributes: #{@branch.errors.full_messages.join(', ')}"
  end

  test "should require a name" do
    @branch.name = " "
    assert_not @branch.valid?, "Branch is valid without a name"
    assert_includes @branch.errors.full_messages, "Name can't be blank"
  end

  test "should require a unique name" do
    @branch.save
    @branch2 = Branch.new(name: @branch.name,
    latitude: 40.7128,
    longitude: -74.0060)
    assert_not @branch2.valid?
  end


  test "latitude should be present" do
    @branch.latitude = " "
    assert_not @branch.valid?
  end

  test "longitude should be present" do
    @branch.longitude = " "
    assert_not @branch.valid?
  end

  test "latitude should be a numerical value greater than or equal to -90" do
    @branch.latitude = -91
    assert_not @branch.valid?
  end

  test "latitude should be a numerical value less than or equal to 90" do
    @branch.latitude = 91
    assert_not @branch.valid?
  end

  test "longitude should be a numerical value greater than or equal to -180" do
    @branch.longitude = -181
    assert_not @branch.valid?
  end

  test "longitude should be a numerical value less than or equal to 180" do
    @branch.longitude = 181
    assert_not @branch.valid?
  end

  test "latitude and longitude should be unique together" do
    @branch.save
    @branch2 = Branch.new(name: "branch2",
    latitude: @branch.latitude,
    longitude: @branch.longitude)
    assert_not @branch2.valid?
  end

  # Add similar tests for other validations (latitude, longitude, uniqueness of latitude, etc.)
end
