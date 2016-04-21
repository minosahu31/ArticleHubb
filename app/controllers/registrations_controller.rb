class RegistrationsController < Devise::RegistrationsController

	def create
		@user = User.new(sign_up_params)
		if @user.save
	        UserMailer.welcome_email(@user).deliver_later
	        #flash[:notice] = 'User was successfully created.'
	        #flash[:alert] = 'Welcome to ArticleHub.com'
			#redirect_to new_user_session_path 
	  yield @user if block_given?
		    if @user.persisted?
		      if @user.active_for_authentication?
		        set_flash_message! :notice, :signed_up
		        sign_up(@user.name, @user)
		        respond_with @user, location: after_sign_up_path_for(@user)
		      else
		        set_flash_message! :notice, :"signed_up_but_#{@user.inactive_message}"
		        expire_data_after_sign_in!
		        respond_with @user, location: after_inactive_sign_up_path_for(@user)
		      end
		    else
		      clean_up_passwords @user
		      set_minimum_password_length
		      respond_with @user
		    end
		end    
	end

	private 

	def sign_up_params
		params.require(:user).permit(:name, :image, :email, :password, :password_confirmation)
	end

	def account_update_params
		params.require(:user).permit(:name, :image, :email, :password, :password_confirmation, :current_password)
	end

end
