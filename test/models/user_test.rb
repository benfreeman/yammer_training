require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(first_name: "Example", last_name: "User", email: "user@example.com", password: "testpassword")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "full_name should be present" do
    assert_equal @user.full_name, "Example User"
  end
end
