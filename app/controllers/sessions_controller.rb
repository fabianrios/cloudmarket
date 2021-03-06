class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to store_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_url
  end
end

