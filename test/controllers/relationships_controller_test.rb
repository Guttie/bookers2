require 'test_helper'

class RelationshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get following_users" do
    get relationships_following_users_url
    assert_response :success
  end

  test "should get follower_users" do
    get relationships_follower_users_url
    assert_response :success
  end

end
