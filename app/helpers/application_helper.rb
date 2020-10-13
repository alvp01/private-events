module ApplicationHelper
  def current_user
    User.find(session[:user_id])
  end

  def user_sign_in?
    !!session[:user_id]
  end
end
