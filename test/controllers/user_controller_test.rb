require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @admin = User.create(first_name: "Example", last_name: "User", email: "user@example.com", password: "testpassword", admin: true)
    @user = User.create(first_name: "Example", last_name: "User", email: "user@example.com", password: "testpassword")
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get index" do
    sign_in @admin
    get :index
    assert_response :success
  end

  test "should get show" do
    sign_in @user
    get :show
    assert_response :success
  end

end
