class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def after_sign_up_path_for(user)
  	new_user_session_path
  end	

  def after_inactive_sign_up_path_for(user)
  	new_user_registration_path
  end

end
