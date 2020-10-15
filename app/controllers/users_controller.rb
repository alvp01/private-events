class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_name] = @user.username
        session[:user_id] = @user.id
        format.html { redirect_to user_path(@user.id), notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @upcoming_events = @user.attended_events.upcoming
    @past_events = @user.attended_events.past
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
