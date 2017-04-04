class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome! #{@user.email}"
      session[:user_id] = @user.id 
      redirect_to root_path
    else
      flash[:danger] = "That email is already in use"
      if user_params["email"] == "" || user_params["password"] == ""
        flash[:more_danger] = "Please fill out all fields"
      end
      redirect_to new_user_path
    end 
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
