class CommentsController < ApplicationController
  before_action :require_signed_in!
  def new

  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.link_id = params[:link_id]
    if @comment.save
      redirect_to link_url(params[:link_id])
    else
      flash[:error] = @comment.errors.full_messages
      redirect_to link_url(params[:link_id])
    end
  end

  def show

  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to link_url(params[:link_id])
    else
      redirect_to link_url(params[:link_id])
    end
  end

  def comment_params
    self.params.require(:comment).permit(:body)
  end
end
