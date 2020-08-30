class HomesController < ApplicationController
	def top
		@blogs = Blog.order(created_at: :desc).limit(4)
	end
	def about
		@random = Photo.all.sample(3)
	end
end