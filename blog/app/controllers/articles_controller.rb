class ArticlesController < ApplicationController
    def index
        @articles = Article.all.order(:created_at).reverse

            if params[:order] == 'created_at DESC'
                @articles = Article.all.order('created_at DESC')
            elsif params[:order] == 'title'
                @articles = Article.all.order('title')
            elsif params[:order] == 'created_at ASC'
                @articles = Article.all.order('created_at ASC')
            else
                @articles = Article.all.reverse
            end 
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        # add current user in this controller for creating new articles
        @article.user = current_user
        
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    
    def edit
        @article=Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        
        redirect_to articles_path
    end
end

private
    def article_params
        params.require(:article).permit(:title, :text)
    end