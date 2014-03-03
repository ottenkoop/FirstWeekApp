class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    begin
      redirect_to '/login', alert: "Not authorized" if current_user.nil?

    rescue ActiveRecord::RecordNotFound
      session[:user_id] = nil
      redirect_to login_url, alert: "You need to re-login"
    end
  end
end
