class OtumamiGenresController < ApplicationController

	def new
		@otumami_genre = OtumamiGenre.new
	end

	def create
		otumami_genre = OtumamiGenre.new(otumami_genre_params)
		otumami_genre.save
		redirect_to otumamis_top_path
	end

	private
  	def otumami_genre_params
  	params.require(:otumami_genre).permit(:name)
  	end

end
