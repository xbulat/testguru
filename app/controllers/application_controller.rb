class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user,
                :logged_in?

  before_action :authenticate_user!

  private

  def authenticate_user!
    unless logged_in?
      store_location
      redirect_to login_path, notice: 'Please introduce yourself'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def redirect_back_or(default)
    redirect_to(session.delete(:forwarding_url) || default)
  end

  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
