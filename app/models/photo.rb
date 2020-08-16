class Photo < ApplicationRecord
	attachment :image
	belongs_to :member
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
end
