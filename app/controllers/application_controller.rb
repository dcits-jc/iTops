class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user! 



  private

  # 用户登陆后重定向到修改密码页面
  def after_sign_in_path_for(resource_or_scope)
    if current_user.is_logined == false
      current_user.is_logined = true
      current_user.save
      edit_user_registration_path
    else
      root_path
    end
  end
  
end
