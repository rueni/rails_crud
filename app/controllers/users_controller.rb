class UsersController < ApplicationController
  def new
    # render a view to signup
  end

  def create
    # create some user and such
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/home' # to a route
    else
      @message = 'Passwords did not match.'
      render '/users/new' # a view
      # render loads an erb view via path
      # it looks for them insides /app/views
    end

  end

private
# everything after private... is private
# only owned by this controller

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
