class Member < ApplicationRecord
  	# Include default devise modules. Others available are:
  	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    attachment :image
    has_many :blogs, dependent: :destroy
    has_many :photos, dependent: :destroy
    has_many :post_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得
    has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得
    has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  	has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人
    attachment :profile_image

    def follow(member_id)
    	follower.create(followed_id: member_id)
  	end

  	# ユーザーのフォローを外す
	def unfollow(member_id)
	    follower.find_by(followed_id: member_id).destroy
  	end

  	# フォローしていればtrueを返す
  	def following?(member)
    	following_member.include?(member)
  	end
end
