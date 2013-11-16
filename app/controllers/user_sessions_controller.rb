class UserSessionsController < ApplicationController

  before_filter :logged_out_required, only: [:new, :create]
  before_filter :logged_in_required, only: :destroy

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:success] = 'Welcome back!'
      redirect_back_or_default root_url
    else
      render action: :new
    end
  end

  def destroy
    current_user_session.destroy
    flash[:success] = 'You are now logged out'
    redirect_back_or_default root_url
  end

end
