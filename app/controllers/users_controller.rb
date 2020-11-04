class UsersController < ApplicationController
  def index
  	@user = User.find(params[:id])
  	@otumami = Otumami.where(user_id: params[:id])
  end

  def show
  	@user = User.find(params[:id])
  	@otumami = Otumami.where(user_id: params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  private
  def user_params
  params.require(:user).permit(:name, :nickname, :phone)
  end

end
