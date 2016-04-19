class CommentsController < ApplicationController

  before_action :authenticate_user!
  before_action :find_user 
  before_action :find_comment, only: [:edit, :update, :destroy]
  before_action :find_article, only: [:update, :destroy, :edit]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @article = params[:comment][:article_id]
    if @comment.save
      #@articles = Article.all
      #@article_comments = Article.comments
      redirect_to article_path(@article)
    else
      render "new"
    end  
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
        #@articles = Article.all
        #@article_comments = Article.comments 
        redirect_to article_path(@article)
    else
        render "edit"
    end 
  end

  def destroy
    if @comment.destroy
      redirect_to article_path(@article)
    end
  end

  private 

  def find_article
    @article = @comment.article
  end

  def find_user
    @user = current_user
  end

  def comment_params
    params.require(:comment).permit(:description,:article_id,:user_id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

end
