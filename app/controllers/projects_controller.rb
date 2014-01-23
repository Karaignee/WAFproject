class ProjectsController < ApplicationController

  before_filter :admin_required, except: [:index, :show, :create, :new ]
  before_filter :logged_in_required, except: [:index]


  def index
    @projects = Project.all

  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @task = Task.new


  end


  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end


  def create
    @project = Project.new(params[:project])
    @project.user_id = current_user.id

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @project = Project.find(params[:id])

      if @project.update_attributes(params[:project])
        redirect_to @project, notice: 'Project was successfully updated.'
      else
        render action: "edit"
      end
  end


  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
