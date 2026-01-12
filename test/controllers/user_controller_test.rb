require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_new_url
    assert_response :success
  end

  test "should post create and redirect on success" do
    assert_difference ["User.count", "Credential.count"], 1 do
      post user_create_url, params: { loginId: "testuser", password: "password", confirmPassword: "password" }
    end
    assert_redirected_to root_path
    assert_equal "ユーザ登録が完了しました", flash[:notice]
    assert_not_nil cookies[:jwt]

    # トークンの内容を検証
    decoded_token = JsonWebToken.decode(cookies[:jwt])
    assert_not_nil decoded_token
    user = User.find_by(user_name: "testuser")
    assert_equal user.user_id, decoded_token[:user_id]
  end

  test "should redirect on password mismatch" do
    post user_create_url, params: { loginId: "testuser", password: "password", confirmPassword: "mismatch" }
    assert_redirected_to user_new_path
    assert_equal "パスワードが一致しません", flash[:alert]
  end

  test "should redirect on validation failure (short loginId)" do
    post user_create_url, params: { loginId: "abc", password: "password", confirmPassword: "password" }
    assert_redirected_to user_new_path
    assert_match /Login (id )?is too short|Login idは4文字以上/, flash[:alert]
  end
end
