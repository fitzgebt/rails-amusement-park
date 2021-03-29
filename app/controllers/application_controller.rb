class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :logged_in
  helper_method :current_user

  private

  def logged_in
    redirect_to '/' unless user_auth
  end

  def user_auth
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end
end
