class CommentsController < ApplicationController
    def create
       @article = Article.find(params[:article_id]) # Retrieve current article and saves it to the @article object
       @comment = @article.comments.create(comment_params)  # Create the @comments object with the params passed by the view
       redirect_to article_path(@article)   # Redirect back to the page with the article and the new comments
    end
    
    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end
end
