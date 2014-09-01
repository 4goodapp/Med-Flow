class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # use in before_action
  def authenticate_user!
    redirect_to login_path unless User.where(id: session[:user_id]).exists?
  end
end
