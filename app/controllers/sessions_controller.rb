class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create

  end

  def destroy
    reset_session
    #flash
    redirect_to "/login"
  end
end
