require 'test_helper'

class OrganizationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get organization_new_url
    assert_response :success
  end

  test "should get create" do
    get organization_create_url
    assert_response :success
  end

end
