class Blog < ApplicationRecord
	attachment :image
	belongs_to :member
	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
  validates :image, presence: true
  validates :title, presence: true, length: { minimum: 1, maximum: 30 }
  validates :body, presence: true
  validates :category, presence: true

	def favorited_by?(member)
    return if member.blank?
    favorites.where(member_id: member.id).exists?
  end
  	enum category:{
    日常:   0, #日常
    食事:   1, #食事
    運動:   2, #運動
    病気:   3, #病気
    その他:  4 #その他
  }
end
