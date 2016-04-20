class LikesController < ApplicationController
  
  def create
  	@user = current_user
  	@article = Article.find(params[:article_id])
  	respond_to do |format|
	  	if Like.create(user_id: @user.id, article_id: @article.id)
		  	# Tell the UserMailer to send a welcome email after save
	        UserMailer.writer_email(@user,@article).deliver_later
	        UserMailer.welcome_email(@user,@article).deliver_later

	  		redirect_to article_path(@article) and return
	        format.html { redirect_to(@user, notice: 'User was successfully created.') } and return
	        format.json { render json: @user, status: :created, location: @user } and return
	    else
	        format.html { render action: 'new' } and return
	        format.json { render json: @user.errors, status: :unprocessable_entity } and return
	    end
  	end
  end

end
