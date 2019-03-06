require 'test_helper'

class TrademarkControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trademark_index_url
    assert_response :success
  end

end
