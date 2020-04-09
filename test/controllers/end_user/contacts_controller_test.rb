require 'test_helper'

class EndUser::ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get end_user_contacts_new_url
    assert_response :success
  end

  test "should get check" do
    get end_user_contacts_check_url
    assert_response :success
  end

  test "should get thanks" do
    get end_user_contacts_thanks_url
    assert_response :success
  end

  test "should get index" do
    get end_user_contacts_index_url
    assert_response :success
  end

  test "should get show" do
    get end_user_contacts_show_url
    assert_response :success
  end

end
