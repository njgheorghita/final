class LinksController < ApplicationController

  def index
    redirect_to '/login' if current_user.nil?
    @link = Link.new
    @links = current_user.links.all unless current_user.nil?
  end

  def create
    link = current_user.links.new(link_params)
    if link.save
      render partial: "link", locals: {link: link}
    elsif link_params["url"] == "" || link_params["title"] == ""
      render json: {status: 401}
    else 
      render json: {status: 400}
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
     @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:success] = "Link Updated!"
      redirect_to root_path
    else
      flash[:danger] = "link not updated: please enter a valid url"
      redirect_to root_path
    end
  end

  private

  def link_params
    params.require(:link).permit(:url, :title, :tag)
  end
end
