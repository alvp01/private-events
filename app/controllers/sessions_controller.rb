class SessionsController < ApplicationController

  def new
  end

  def create
    @user = authenticate(session_params)

    respond_to do |format|
      if @user
        session[:user_name] = @user.username
        format.html { redirect_to user_path(@user.id), notice: 'successfully logged in' }
      else
        format.html { redirect_to new_session_path, notice: 'User not found!' }
      end
    end
  end

  private

  def authenticate(username)
    User.find_by(username)
  end

  def session_params
    params.require(:session).permit(:username)
  end

end
