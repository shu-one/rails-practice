class UserController < ApplicationController
  def new
  end

  def create
    user = User.new(user_name: params[:loginId]) # 仮でloginIdを名前として使う
    credential = Credential.new(login_id: params[:loginId], password: params[:password], user: user)

    if params[:password] != params[:confirmPassword]
      redirect_to user_new_path, alert: "パスワードが一致しません"
      return
    end

    unless credential.save
      redirect_to user_new_path, alert: credential.errors.full_messages.join(", ")
    end
  end
end
