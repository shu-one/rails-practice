class UserController < ApplicationController
  skip_before_action :authenticate_user, only: [ :new, :create ]

  def new
  end

  def create
    user = User.new(user_name: params[:loginId]) # 仮でloginIdを名前として使う
    credential = Credential.new(login_id: params[:loginId], password: params[:password], user: user)

    if params[:password] != params[:confirmPassword]
      redirect_to user_new_path, alert: "パスワードが一致しません"
      return
    end

    if credential.save
      token = JsonWebToken.encode(user_id: user.user_id)
      cookies[:jwt] = {
        value: token,
        httponly: true,
        expires: 24.hours.from_now
      }
      # TODO: 登録成功後の遷移先が決まったら修正する
      redirect_to root_path, notice: "ユーザ登録が完了しました"
    else
      redirect_to user_new_path, alert: credential.errors.full_messages.join(", ")
    end
  end
end
