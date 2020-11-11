class FavoritesController < ApplicationController

	def index
    	@user = current_user
    	@favorites = Favorite.where(user_id: @user.id).all
  	end


	def create
		otumami = Otumami.find(params[:otumami_id])
		favorite = Favorite.new(params[:id])
		favorite.otumami_id = otumami.id
		favorite.user_id = current_user.id
		favorite.save
		redirect_back(fallback_location:otumamis_path)
	end

	def destroy
		otumami = Otumami.find(params[:otumami_id])
		favorite = current_user.favorites.find_by(otumami_id: otumami.id)
    	favorite.destroy
    	 redirect_back(fallback_location:otumamis_path)
	end

end
