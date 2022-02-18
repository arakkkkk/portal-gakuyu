require "test_helper"

class GakuyuInfoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get gakuyu_info_new_url
    assert_response :success
  end
end
