class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def check_login
    unless authorized?
      redirect_to "/"
    end
  end

  def logged_in?
    if session[:user_id]
      return true
    else
      return false
    end
  end

  protected
  def authorized?
    logged_in? && (request.get? || current_user.admin?)
  end

end
