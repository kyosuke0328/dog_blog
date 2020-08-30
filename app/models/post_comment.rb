class PostComment < ApplicationRecord
	belongs_to :member
	belongs_to :blog
end
