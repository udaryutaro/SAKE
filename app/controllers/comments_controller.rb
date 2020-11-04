class CommentsController < ApplicationController

	def create
		otumami = Otumami.find(params[:otumami_id])
		comment = Comment.new(comment_params)
		comment.otumami_id = otumami.id
		comment.user_id = current_user.id
		comment.save
		redirect_to otumami_path(otumami.id)
	end

	def destroy
		comment = Comment.find(params[:id])
		comment.destroy
		redirect_back(fallback_location:otumamis_path)
	end

	private
  	def comment_params
  		params.require(:comment).permit(:comment)
  	end

end
