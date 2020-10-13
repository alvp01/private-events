class ApplicationController < ActionController::Base
  before_action :require_login

  private
  def require_login
    unless helpers.user_sign_in?
      respond_to do |format|
          format.html { redirect_to new_session_path, notice: 'You must be logged in to access this section' }
      end
    end
  end
end
