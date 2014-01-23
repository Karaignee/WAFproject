class UsersController < ApplicationController

  before_filter :logged_in_required, except: [:new, :create, :activate]
  before_filter :admin_required, only: [:destroy]
  before_filter :get_stuff


  def create_ngo_profile
    @ngo_profile = NgoProfile.new(params[:ngo_profile])
    @ngo_profile.user_id = current_user.id unless current_user.admin?
    if @ngo_profile.save
      flash[:success] = 'Your profile has been created.'
    else
      flash[:success] = 'Sorry, an error occurred.'
    end
    redirect_to @ngo_profile.user
  end

  def update_ngo_profile
    if current_user.admin?
      @ngo_profile = NgoProfile.find(params[:id])
    else
      @ngo_profile = current_user.ngo_profile
    end
    params[:ngo_profile][:user_id] = current_user.id
    if @ngo_profile.update_attributes(params[:ngo_profile])
      flash[:success] = 'Your profile has been updated.'
    else
      flash[:error] = 'Sorry, an error occurred. ' + @ngo_profile.errors.full_messages.to_sentence
    end
    redirect_to @ngo_profile.user
  end


  def create_vol_profile
    @vol_profile = VolProfile.new(params[:vol_profile])
    @vol_profile.user_id = current_user.id unless current_user.admin?
    if @vol_profile.save
      flash[:success] = 'Your profile has been created.'
    else
      flash[:error] = 'An error has occurred'
    end
    redirect_to @vol_profile.user
  end

  def update_vol_profile
    if current_user.admin?
      @vol_profile = VolProfile.find(params[:id])
    else
      @vol_profile = current_user.vol_profile
    end
    if @vol_profile.update_attributes(params[:vol_profile])
      flash[:success] = 'Your details have been updated.'
    else
      flash[:error] = 'Sorry, an error occurred. ' + @vol_profile.errors.full_messages.to_sentence
    end
    redirect_to @vol_profile.user
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

  protected

  def get_stuff
    if current_user && current_user.admin?
      @user_groups = UserGroup.all
    else
      @user_groups = UserGroup.where(is_an_admin: false)   #to prevent visibility of admin in dropdown
    end
  end
end