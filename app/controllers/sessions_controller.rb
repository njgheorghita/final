class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id 
      #flash
      redirect_to root_path
    else
      #flash
      redirect_to '/login'
    end  
  end

  def destroy
    reset_session
    #flash
    redirect_to "/login"
  end
end
