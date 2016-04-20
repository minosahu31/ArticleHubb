class CommentLikesController < ApplicationController
  
  def create
  	@user = current_user
  	@article = Article.find(params[:article_id])
  	@comment = Comment.find(params[:comment_id])
  	respond_to do |format|
	  	if CommentLike.create(user_id: @user.id, comment_id: @comment.id)
		  	# Tell the UserMailer to send a welcome email after save
	        UserMailer.comment_writer_email(@user,@comment,@article).deliver_later
	        UserMailer.comment_liker_email(@user,@comment,@article).deliver_later

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
