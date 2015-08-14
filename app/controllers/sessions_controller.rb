class SessionsController < ApplicationController
  def new
    # show a login form
  end

  def create
    # post request to validate/create a session
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      # Success - we're logged in
      session[:user_id] = @user.id
      redirect_to '/home'
    else
      @message = 'Login Error - Please try again'
      render '/sessions/new'
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to '/users/login'
  end
end
