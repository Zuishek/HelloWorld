class CommentsController < BlogController
	
	def index
		@comment = Comment.all
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def create
	
		
		@article = Article.find(params[:article_id])

		@comment = @article.comments.create(comment_params)
        @comment.user = current_user
		redirect_to article_path(@article)

	end

	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private
	 
	def comment_params
	  params.require(:comment).permit( :body)
	end
end
