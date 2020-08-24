require 'test_helper'

class BossesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bosses_index_url
    assert_response :success
  end

  test "should get show" do
    get bosses_show_url
    assert_response :success
  end

end
