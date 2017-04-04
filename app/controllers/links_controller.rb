class LinksController < ApplicationController

  def index
    redirect_to '/login' if current_user.nil?
    @link = Link.new
    @links = current_user.links.all unless current_user.nil?
  end

  def create
    link = current_user.links.new(link_params)
    if link.save
      flash[:success] = "Link saved!"
      redirect_to root_path
    else
      flash[:danger] = "Invalid Link"
      redirect_to root_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title)
  end
end
