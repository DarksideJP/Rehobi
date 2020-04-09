require 'test_helper'

class EndUser::ExamplesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_user_examples_index_url
    assert_response :success
  end

  test "should get show" do
    get end_user_examples_show_url
    assert_response :success
  end

end
