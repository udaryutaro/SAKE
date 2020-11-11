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
		@otumami_genres = OtumamiGenre.all
		# urlにcategory_id(params)がある場合
        if params[:otumami_genre_id]
		    # Categoryのデータベースのテーブルから一致するidを取得
		    @otumami_genre = OtumamiGenre.find(params[:otumami_genre_id])
		    # category_idと紐づく投稿を取得
		    @otumamis = @otumami_genre.otumamis.order(created_at: :desc).all.page(params[:page]).per(8)
		else
		    # 投稿すべてを取得
	        @otumamis = Otumami.order(created_at: :desc).all.page(params[:page]).per(8)
    	end
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
