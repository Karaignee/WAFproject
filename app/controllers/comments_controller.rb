class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    @comment.save
    redirect_to forum_url(@comment.forum_id)
  end

  def update

  end

  def destroy
  end
end
