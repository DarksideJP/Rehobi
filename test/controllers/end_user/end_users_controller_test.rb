require 'test_helper'

class EndUser::EndUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get my_page" do
    get end_user_end_users_my_page_url
    assert_response :success
  end

  test "should get edit" do
    get end_user_end_users_edit_url
    assert_response :success
  end

end
