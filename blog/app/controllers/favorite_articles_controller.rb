class FavoritesController < ApplicationController
    
 def create
        if Favorite.create(favorited: @article, user: current_user)
        redirect_to @article, notice: 'Article Favorited'
        else
        redirect_to @article, alert: 'Something went wrong'
        end
 end

    def destroy
         Favorite.where(favorited_id: @article = Article.find(params[:id]), user_id: current_user.id).first.destroy
         redirect_to @article, notice: 'Article unfavorited'
    end

    private

    def set_article
         @article = Article.find(params[:article_id] || params[:id])
    end
end