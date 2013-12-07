class UserGroupsController < ApplicationController

  before_filter :logged_in_required
  before_filter :admin_required


  def index
    @user_groups = UserGroup.all


  end


  def show
    @user_group = UserGroup.find(params[:id])

  end


  def new
    @user_group = UserGroup.new

   end

  def edit
    @user_group = UserGroup.find(params[:id])
  end

  def create
    @user_group = UserGroup.new(params[:user_group])

    respond_to do |format|
      if @user_group.save
        format.html { redirect_to @user_group, notice: 'User group was successfully created.' }
        format.json { render json: @user_group, status: :created, location: @user_group }
      else
        format.html { render action: "new" }
        format.json { render json: @user_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user_group = UserGroup.find(params[:id])

    respond_to do |format|
      if @user_group.update_attributes(params[:user_group])
        format.html { redirect_to @user_group, notice: 'User group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_group = UserGroup.find(params[:id])
    @user_group.destroy

  end
end
