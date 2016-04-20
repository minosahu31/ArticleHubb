class CommentLikesController < ApplicationController
  
  def create
  	@user = current_user
  	@article = Article.find(params[:article_id])
  	@comment = Comment.find(params[:comment_id])
  	if CommentLike.create(user_id: @user.id, comment_id: @comment.id)
  		redirect_to article_path(@article)
  	end	
  end

end
