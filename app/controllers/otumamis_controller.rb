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
	end

	def edit
		@otumami = Otumami.find(params[:id])
	end

	def update
		
	end

	def destroy
		
	end

	private
  	def otumami_params
  	params.require(:otumami).permit(:title, :image, :body, :otumami_genre_id, :user_id)
  	end


end
