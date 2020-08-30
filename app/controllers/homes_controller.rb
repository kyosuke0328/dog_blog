class HomesController < ApplicationController
	def top
		@blogs = Blog.order(created_at: :desc).limit(4)
	end
	def about
		@random = Photo.Photo.all.sample(2)
	end
end