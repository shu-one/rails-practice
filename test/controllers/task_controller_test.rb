require "test_helper"

class TaskControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    # user_id が自動生成されない場合は手動で設定する必要があるかもしれないが、一旦既存の仕組みに任せる
    @token = JsonWebToken.encode(user_id: @user.user_id)
    cookies[:jwt] = @token
  end

  test "should create task via API" do
    # cookies[:jwt] は setup で設定済み
    assert_difference("Task.count") do
      post "/api/task/new", params: {
        task: {
          task_name: "Test Task",
          end_time: Time.current + 1.day,
          description: "Test Description",
          task_status_id: "todo"
        }
      }, as: :json
    end

    assert_response :created
    json_response = JSON.parse(response.body)
    assert_equal "success", json_response["status"]
    assert_equal "Test Task", json_response["data"]["task_name"]
    assert_equal @user.user_id, json_response["data"]["user_id"]
  end

  test "should not create task without authentication" do
    # 新しいセッションでリクエストを送信するか、明示的にCookieをクリアしてリクエストする
    # IntegrationTest では cookies はリクエスト間で維持されることがある
    post "/api/task/new", params: {
      task: {
        task_name: "Test Task"
      }
    }, as: :json, headers: { "Cookie" => "" }

    assert_response :redirect
  end

  test "should get show" do
    get task_show_url
    assert_response :success
  end

  test "should get index" do
    get task_index_url
    assert_response :success
  end
end
