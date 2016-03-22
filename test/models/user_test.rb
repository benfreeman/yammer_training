require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: "Example", last_name: "User", email: "user@example.com",
                        password: "testpassword", password_confirmation: "testpassword")
  end

  test "user should be valid" do
    assert @user.valid?
  end

  test "full_name should be present" do
    @user.save
    assert_equal @user.full_name, "Example User"
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "email address should be lowercase" do
    duplicate_user = @user.dup
    duplicate_user.email = "USER@example.com"
    duplicate_user.save
    duplicate_user.reload
    assert_equal duplicate_user.email, @user.email
  end
end
