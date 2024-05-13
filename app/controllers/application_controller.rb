class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  private

  def stop_if_logged_in
    redirect_to root_path if current_user
  end

  def stop_if_logged_out
    redirect_to root_path unless current_user
  end
end
