class CategoriesController < ApplicationController
  
  before_action :authenticate_user!
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @articles = @category.articles
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      #@categories = Category.all
      redirect_to categories_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      #@categories = Category.all
      redirect_to categories_path
    else
      redner "edit"
    end
  end

  def destroy
    if @category.destroy
      redirect_to categories_path
    end 
  end

  private 

  def find_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end

end
