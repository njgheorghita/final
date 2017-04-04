class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #flash
      session[:user_id] = @user.id 
      redirect_to root_path
    else
      # flash 
      render :new
    end 
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :address)
  end
end
