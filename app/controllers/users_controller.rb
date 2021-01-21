class UsersController < ApplicationController
  before_action :check_logged_in?, only: [:new, :create]

  def new
    
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to contacts_path, notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Logged out!"
  end

  private
  def check_logged_in?
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
    if @current_user.present?
      redirect_to contacts_path
    end
  end
end
