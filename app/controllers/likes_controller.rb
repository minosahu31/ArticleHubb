class LikesController < ApplicationController
  
  def create
  	@user = current_user
  	@article = Article.find(params[:article_id])
  	if Like.create(user_id: @user.id, article_id: @article.id)
  		redirect_to article_path(@article)
  	end 
  end

end
