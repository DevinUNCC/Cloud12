class ArticlesController < ApplicationController
    def index
        @articles = Article.all.order(:created_at).reverse

            if params[:order] == 'created_at DESC'
                @articles = Article.all.order('created_at DESC')
            elsif params[:order] == 'title'
                @articles = Article.all.order('title')
            elsif params[:order] == 'created_at ASC'
                @articles = Article.all.order('created_at ASC')
            elsif params[:order] == 'rating'
                @articles = Article.all.order(:likes)
            else
                @articles = Article.all.reverse
            end 
            
            @articles = Article.all
        
        if params[:search]
        @articles = Article.search(params[:search]).order("created_at DESC")
        else
        @articles = Article.all.order('created_at DESC')
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
    
     def favorite
        @article = Article.find params[:id]
        type = params[:type]
        
        if type == "favorite"
            current_user.favorites << @article
            redirect_back fallback_location: @article, notice: "You favorited #{@article.title}"
            
        elsif type == "unfavorite"
             current_user.favorites.delete(@article)
             redirect_back fallback_location: @article, notice: "Unfavorited #{@article.title}"
             
             
        else
             redirect_back fallback_location: root_path, notice: "Nothing happened"
             
        end
     end
    
end

private
    def article_params
        params.require(:article).permit(:title, :text, :search, :favorite)
    end