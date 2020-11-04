class Otumami < ApplicationRecord

	#アソシエーション
	has_many :comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	belongs_to :user
	belongs_to :otumami_genre

	attachment :image

end
