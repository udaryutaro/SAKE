class OtumamisController < ApplicationController

	def top
	end

	def new
		@otumami = Otumami.new
	end

	def create
		otumami = Otumami.new(otumami_params)
		otumami.user_id = current_user.id
		otumami.save
		redirect_to otumamis_path
	end

	def index
		@otumami = Otumami.all
	end

	def show
		@otumami = Otumami.find(params[:id])
		@comment = Comment.new
		@comments = @otumami.comments
	end

	def edit
		@otumami = Otumami.find(params[:id])
	end

	def update
		otumami = Otumami.find(params[:id])
		otumami.update(otumami_params)
		redirect_to otumami_path(otumami.id)
	end

	def destroy
		@otumami = Otumami.find(params[:id])
		@otumami.destroy
		redirect_to otumamis_path
	end

	private
  	def otumami_params
  	params.require(:otumami).permit(:title, :image, :body, :otumami_genre_id, :user_id)
  	end


end
