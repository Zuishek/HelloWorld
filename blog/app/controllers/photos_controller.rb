class PhotosController < ApplicationController
	def index
	end
	def create
		@article = Article.find(params[:article_id])
		@photo = @article.photos.create(photo_params)
		redirect_to article_path(@article)
	end

	private
	def photo_params
		params.require(:photo).permit(:image)
	end
end
