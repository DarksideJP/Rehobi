require 'test_helper'

class Admin::HomeBuildersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_home_builders_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_home_builders_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_home_builders_edit_url
    assert_response :success
  end

end
