class CommentsController < ApplicationController

  before_filter :logged_in_required
  before_filter :admin_required, except: [:create, :update ]
  #before_filter :get_variables
  #before_filter :start_breadcrumbs

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
