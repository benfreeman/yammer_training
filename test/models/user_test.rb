require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "full_name should be present" do
    @user.full_name = "  "
    assert_not @user.valid?
  end
end
