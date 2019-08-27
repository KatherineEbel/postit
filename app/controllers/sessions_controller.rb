class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_username(params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome back, #{user.username}"
      redirect_to root_path
    else
      flash[:error] = 'There was a problem with your login information'
      redirect_to register_path
    end
  end

  def destroy
    user = User.find session[:user_id]
    session[:user_id] = nil
    flash[:notice] = "See you next time #{user.username}"
    redirect_to root_path
  end
end