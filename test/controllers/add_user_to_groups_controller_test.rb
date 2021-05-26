require 'test_helper'

class AddUserToGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get add_user_to_groups_destroy_url
    assert_response :success
  end

end
