require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  setup do
    @article = articles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should get new" do
    sign_in @user
    get :new
    assert_response :success
  end

  test "should create article" do
    sign_in @user
    assert_difference('Article.count') do
      post :create, article: {  }
    end

    assert_redirected_to article_path(assigns(:article))
  end

  test "should show article" do
    get :show, id: @article
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get :edit, id: @article
    assert_response :success
  end

  test "should update article" do
    sign_in @user
    patch :update, id: @article, article: {  }
    assert_redirected_to article_path(assigns(:article))
  end

  test "should destroy article" do
    sign_in @user
    assert_difference('Article.count', -1) do
      delete :destroy, id: @article
    end

    assert_redirected_to articles_path
  end
end
