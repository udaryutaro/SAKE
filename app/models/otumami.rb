class Otumami < ApplicationRecord

	#アソシエーション
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	#いいね機能
	def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
    end

	belongs_to :user
	belongs_to :otumami_genre

	attachment :image

end
