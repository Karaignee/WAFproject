class ApplicationController < ActionController::Base


  Time::DATE_FORMATS[:simple] = '%d %b %Y'
  Time::DATE_FORMATS[:standard] = '%e %b %Y %H:%M'

  helper :all
  helper_method :current_user_session, :current_user, :admin_required

  private

  def current_user_session
    return @current_user_session if
        defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session &&
        current_user_session.record
  end

  def logged_in_required
    unless current_user
      store_location
      flash[:notice] = "You must be logged in to access this page"
      redirect_to sign_in_url
      return false
    end
  end

  def logged_out_required
    if current_user
      flash[:notice] = "You must be logged out to access this page"
      redirect_to root_url
      return false
    end
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    if session[:return_to]
      destination = session[:return_to]
      session[:return_to] = nil
    else
      destination = default
      session[:return_to] = nil
    end
    redirect_to(destination)
  end

  def admin_required
    if current_user && current_user.user_group.is_an_admin
      # everything is super
    else
      flash[:error] = 'You are not permitted to do that!'
      redirect_to root_url
      return false
    end
  end

end