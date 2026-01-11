require "test_helper"

class TopControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to user_new if not logged in" do
    get root_url
    assert_redirected_to user_new_path
  end

  test "should get index if logged in" do
    user = User.create!(user_name: "testuser")
    token = JsonWebToken.encode(user_id: user.id)
    cookies[:jwt] = token

    get root_url
    assert_response :success
  end

  test "should redirect to user_new if JWT is invalid" do
    cookies[:jwt] = "invalid_token"
    get root_url
    assert_redirected_to user_new_path
  end

  test "should redirect to user_new if user_id in JWT does not exist" do
    token = JsonWebToken.encode(user_id: -1)
    cookies[:jwt] = token
    get root_url
    assert_redirected_to user_new_path
  end
end
