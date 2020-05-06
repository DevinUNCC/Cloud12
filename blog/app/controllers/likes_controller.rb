class LikesController < ApplicationController
   skip_before_action :verify_authenticity_token
   before_action :find_article
  
  def create
    @article.likes.create()
    redirect_back(fallback_location: root_path)
  end
      
  
  private
    def find_article
        @article = Article.find(params[:article_id])
    end
    
end
