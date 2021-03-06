class FavoritesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @favorites = @user.fav_articles
  end

  def create
    favorite = current_user.favorites.build(article_id: params[:article_id])
    favorite.save
    # redirect_to articles_path
    redirect_back(fallback_location: root_path)
  end

  def destroy
    favorite = Favorite.find_by(article_id: params[:article_id], user_id: current_user.id)
    favorite.destroy
    # redirect_to articles_path
    redirect_back(fallback_location: root_path)
  end
end
