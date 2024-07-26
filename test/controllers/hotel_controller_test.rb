require "test_helper"

class HotelControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get hotel_search_url
    assert_response :success
  end
end
