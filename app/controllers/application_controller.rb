class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token # TODO React 内のクライアントやフォームからトークンが送れないが原因は別途調査。

  before_action :authenticate_user

  def current_user
    return @current_user if @current_user

    token = cookies[:jwt]
    decoded = JsonWebToken.decode(token) if token
    if decoded && decoded[:user_id]
      @current_user = User.find_by(user_id: decoded[:user_id])
    end
    @current_user
  end

  private

  def authenticate_user
    redirect_to user_new_path unless current_user
  end
end
