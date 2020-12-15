class OtumamiGenresController < ApplicationController

	def new
		@otumami_genre = OtumamiGenre.new
	end

	def create
		otumami_genre = OtumamiGenre.new(otumami_genre_params)

		#otumami_genre.save
		#redirect_to otumamis_top_path

		#####
		otumami_genre_check = OtumamiGenre.find_by(name: otumami_genre.name)
		if otumami_genre_check == nil
			# 名前が存在しない
			otumami_genre.save
			redirect_to otumamis_top_path
		else
			# 名前がすでに存在する
			# なんかえらーの処理
			flash[:error] = "すでに存在するジャンルです。"
			redirect_to new_otumami_genre_path
		end
	end

	private
  	def otumami_genre_params
  	params.require(:otumami_genre).permit(:name)
  	end

end
