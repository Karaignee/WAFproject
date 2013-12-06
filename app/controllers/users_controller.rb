class UsersController < ApplicationController
  # GET /users
  # GET /users.json


#TODO: method for showing the profiles will be an if, elseif, else, end statement controlling the 3 views.  Are my routes set up for this?

  def new_ngo_profile
    @ngo_profile = NgoProfile.new(params[:ngo_profile])
    @ngo_profile.user_id = current_user.id
    if @ngo_profile.save
      flash[:success] = 'Your details have been saved.'
      redirect_to current_user
    else
      render 'show'
    end
  end

  def edit_ngo_profile
    @ngo_profile = NgoProfile.find(params[:id])
    params[:ngo_profile][:user_id] = current_user.id
    if @ngo_profile.update(params[:about])

    end

  end


  def new_vol_profile
    @vol_profile = VolProfile.new(params[:skill])
    @vol_profile.user_id = current_user.id
    if @vol_profile.save
      flash[:success] = 'Your About section has been saved.'
      redirect_to current_user
    else
      render 'show'
    end

  end

  def edit_vol_profile
    @vol_profile = VolProfile.find(params[:id])
    params[:vol_profile][:user_id] = current_user.id
    if @vol_profile.update(params[:about])
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
    if current_user.admin? && params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end

  end

   def new
    @user = User.new

  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

  end
end
