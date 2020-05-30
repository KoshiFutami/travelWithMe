class CategoriesController < ApplicationController
  before_action :find_category, only: [:show]

  def index
    @categories = Category.all
  end

  def show
    @articles = Article.categories.find(category_id: @category.id)
  end

  private
  
  def find_category
    @category = Category.find(params[:id])
  end
end
