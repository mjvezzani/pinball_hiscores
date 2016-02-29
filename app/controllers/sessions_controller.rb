class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to pins_path
    end
  end

  def create
    user = User.find_by(username: params[:username])

    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome back, #{user.username}"
      redirect_to pins_path
    else
      flash[:error] = "Your credentials appear to be incorrect. Please try again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "See you next time!"
    redirect_to login_path
  end
end
