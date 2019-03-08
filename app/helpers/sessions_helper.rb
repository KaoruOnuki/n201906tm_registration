module SessionsHelper
  def current_user
    if session[:admin_user_id] == nil
      @current_user ||= User.find_by(id: session[:user_id])
    elsif session[:user_id] == nil
      @current_user ||= AdminUser.find_by(id: session[:admin_user_id])
    end
  end

  def logged_in?
    current_user.present?
  end
end
