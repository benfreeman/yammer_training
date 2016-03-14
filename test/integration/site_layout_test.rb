require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'articles/index'
    assert_select "a[href=?]", about_path
  end
end
