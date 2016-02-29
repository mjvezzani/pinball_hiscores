class UsersController < ApplicationController
  # before_action :require_user, except: [:new, :create]

  def index
    redirect_to edit_user_path(current_user)
  end

  def show
    redirect_to edit_user_path(current_user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome back!"
      session[:user_id] = @user.id

      if session[:user_id] == @user.id
        redirect_to pins_path
      else
        session[:user_id] = nil
        redirect_to register_path
      end
    else
      flash[:error] = "There was a problem with your registration. Please try again."
      render :new
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)

    if @user.update!(user_params)
      flash[:success] = "You have successfully updated your profile"
      redirect_to user_path(@user)
    else
      flash[:error] = "Something went wrong."
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, {pin_ids: []})
  end
end
