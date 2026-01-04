class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token # TODO React 内のクライアントやフォームからトークンが送れないが原因は別途調査。
end
