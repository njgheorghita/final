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
      if User.find_by(email: user_params["email"])
        flash[:danger] = "That email is already in use"
      end
      if user_params["email"] == "" || user_params["password"] == "" || user_params["password_confirmation"] == ""
        flash[:more_danger] = "Please fill out all fields"
      end
      if params["user"]["password"] != params["user"]["password_confirmation"]
        flash[:other_danger] = "Please make sure passwords match"
      end
      redirect_to new_user_path
    end 
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
