class TasksController < ApplicationController

  before_filter :logged_in_required


  def new
    @task = Task.new

  end


  def edit
    @task = Task.find(params[:id])
  end


  def create
    @task = Task.new(params[:task])
    @task.save
      redirect_to project_url(@task.project_id)
  end


  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to @task.project, notice: 'Project status updated.'
    else
      render :edit
    end
  end


  def destroy
    @task = Task.find(params[:id])
    @task.destroy

  end
end
