class UsersController < ApplicationController

  before_filter :logged_in_required, except: [:new, :create, :activate]
  before_filter :admin_required, only: [:destroy]
  #before_filter :start_breadcrumbs

  #TODO: method for showing the profiles will be an if, elseif, else, end statement controlling the 3 views.  Are my routes set up for this?

  def create_ngo_profile
    @ngo_profile = NgoProfile.new(params[:ngo_profile])
    @ngo_profile.user_id = current_user.id
    if @ngo_profile.save
      flash[:success] = 'Your profile has been created.'
      redirect_to current_user
    else
      render 'show'
    end
  end

  def update_ngo_profile
    @ngo_profile = NgoProfile.find(params[:id])
    params[:ngo_profile][:user_id] = current_user.id
    if @ngo_profile.update_attributes(params[:ngo_profile])
      flash[:success] = 'Your profile has been updated.'
      redirect_to current_user
    else
      render 'show'
    end

  end


  def create_vol_profile
    @vol_profile = VolProfile.new(params[:vol_profile])
    @vol_profile.user_id = current_user.id
    if @vol_profile.save
      flash[:success] = 'Your About section has been saved.'
      redirect_to current_user
    else
      render 'show'
    end

  end

  def update_vol_profile
    @vol_profile = VolProfile.find(params[:id])
    params[:vol_profile][:user_id] = current_user.id
    if @vol_profile.update_attributes(params[:vol_profile])
      flash[:success] = 'Your skill details have been updated.'
    else
      flash[:error] = 'Sorry, an error occurred. ' + @vol_profile.errors.full_messages.to_sentence
    end
    redirect_to current_user
  end

  def index
    @users = User.all

  end

  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    @ngo_profile = NgoProfile.new
    @vol_profile = VolProfile.new
  end

  def new
    @user = User.new

  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_url
  end
end