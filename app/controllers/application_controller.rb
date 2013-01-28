class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def login?
    current_user.presence
  end

  helper_method :current_user, :login?, :respond_to_model

  def authenticate
    if request.fullpath.match(/^\/qrapi/)
      redirect_to '/sessions' unless login?
    end
  end

end
