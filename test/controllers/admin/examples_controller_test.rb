require 'test_helper'

class Admin::ExamplesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_examples_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_examples_show_url
    assert_response :success
  end

  test "should get new" do
    get admin_examples_new_url
    assert_response :success
  end

  test "should get check" do
    get admin_examples_check_url
    assert_response :success
  end

  test "should get edit" do
    get admin_examples_edit_url
    assert_response :success
  end

end
