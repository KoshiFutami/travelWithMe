class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]   

  def index
    @articles = Article.all.order('created_at DESC')

  end
  
  def show
    @comments = @article.comments
    @comment = Comment.new
    @favorite = current_user.favorites.find_by(article_id: @article.id)
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def new
    @article = current_user.articles.build
    @categories = Category.all
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end


  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :image, tag_ids: [])
  end

end
