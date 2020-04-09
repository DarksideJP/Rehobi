require 'test_helper'

class EndUser::FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_user_favorites_index_url
    assert_response :success
  end

end
