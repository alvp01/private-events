module ApplicationHelper
  def current_user
    User.find_by(username: session[:user_name])
  end
end
