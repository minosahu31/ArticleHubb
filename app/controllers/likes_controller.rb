class LikesController < ApplicationController
  
  def create
  	raise params.inspect
  	@user = current_user
  	@like = UserLike.new(:user_id => @user, :article_id => @article)
  	if @like.save

  	end 
  end

end
