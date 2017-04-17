class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id 
      flash[:success] = "Successfully logged in"
      redirect_to root_path
    else
      flash[:danger] = "Please try again"
      redirect_to '/login'
    end  
  end

  def destroy
    reset_session
    flash[:danger] = "Successfully logged out"
    redirect_to "/login"
  end
end
