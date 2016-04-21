class RegistrationsController < Devise::RegistrationsController

	def create
		@user = User.new(sign_up_params)
		if @user.save
	        UserMailer.welcome_email(@user).deliver_later
	        flash[:notice] = 'User was successfully created.'
	        flash[:alert] = 'Welcome to ArticleHub.com'
			redirect_to articles_path and return

			format.html { redirect_to(@user, notice: 'User was successfully created.') } and return
	        format.json { render json: @user, status: :created, location: @user } and return
	    else
	        format.html { render action: 'new' } and return
	        format.json { render json: @user.errors, status: :unprocessable_entity } and return
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
