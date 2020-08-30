class Photo < ApplicationRecord
	attachment :image
	belongs_to :member
	validates :image, presence: true
end
