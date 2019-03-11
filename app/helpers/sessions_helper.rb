module SessionsHelper
  def current_user
    if session[:user_id].present?
      @current_user ||= User.find_by(id: session[:user_id])
    elsif session[:admin_user_id].present?
      @current_user ||= AdminUser.find_by(id: session[:admin_user_id])
    end
  end

  def logged_in?
    current_user.present?
  end

  def logged_in_as_a_user?
    current_user.present? && session[:user_id].present?
  end

  def logged_in_as_an_adminuser?
    current_user.present? && session[:admin_user_id].present?
  end
end
