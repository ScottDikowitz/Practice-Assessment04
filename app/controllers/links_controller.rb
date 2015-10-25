class LinksController < ApplicationController
  before_action :require_signed_in!
  def index
    @links = Link.all
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id
    if @link.save
      redirect_to link_url(@link.id)
    else
      flash[:error] = @link.errors.full_messages
      redirect_to links_url
    end
  end

  def show
    @comments = Comment.all
    @link = Link.find(params[:id])
  end

  def edit
    @link = Link.find(params[:id])
  end
  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      render :show
    else
      flash[:error] = @link.errors.full_messages
      redirect_to edit_link_url(@link.id)
    end
  end

  def link_params
    self.params.require(:link).permit(:title, :url)
  end
end
