require 'test_helper'

class KintaibPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get kintaib_pages_top_url
    assert_response :success
  end

end
