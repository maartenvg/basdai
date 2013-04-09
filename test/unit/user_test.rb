require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Males should render properly" do
    user = users(:john)
    assert_equal 'Male', user.print_gender
  end
  
  test "Females should render properly" do
    user = users(:jane)
    assert_equal 'Female', user.print_gender
  end
  
  test "Age should be calculated correctly" do
    user = users(:john)
    user.birthdate = DateTime.new(1930, 11, 23)
    Time.stubs(:now).returns(DateTime.new(2004, 2, 2))
    assert_equal 73, user.age
  end
end
