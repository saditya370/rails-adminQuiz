require "test_helper"

class FeedbackControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get feedback_index_url
    assert_response :success
  end

  test "should get create" do
    get feedback_create_url
    assert_response :success
  end

  test "should get show" do
    get feedback_show_url
    assert_response :success
  end
end
