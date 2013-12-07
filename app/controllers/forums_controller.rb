class ForumsController < ApplicationController

  before_filter :logged_in_required, except: [:show, :index ]
  before_filter :admin_required, only: [:destroy]
  #before_filter :get_variables
  #before_filter :start_breadcrumbs

  def index
    @forums = Forum.all

  end

  def show
    @forum = Forum.find(params[:id])
    @comment = Comment.new

  end

  def new
    @forum = Forum.new

  end

  def edit
    @forum = Forum.find(params[:id])
  end

  def create
    @forum = Forum.new(params[:forum])
    @forum.user_id = current_user.id


      if @forum.save
        redirect_to @forum, notice: 'Forum was successfully created.'
      else
        render action: "new"
      end
  end

  # PUT /forums/1
  # PUT /forums/1.json
  def update
    @forum = Forum.find(params[:id])

    respond_to do |format|
      if @forum.update_attributes(params[:forum])
        format.html { redirect_to @forum, notice: 'Forum was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forums/1
  # DELETE /forums/1.json
  def destroy
    @forum = Forum.find(params[:id])
    @forum.destroy

    respond_to do |format|
      format.html { redirect_to forums_url }
      format.json { head :no_content }
    end
  end
end
