class FavoritesController < ApplicationController
	before_action :authenticate_member!
	def create
	    blog = Blog.find(params[:blog_id])
	    favorite = current_member.favorites.new(blog_id: blog.id)
	    favorite.save
	    redirect_to request.referer
    end

  	def destroy
		blog = Blog.find(params[:blog_id])
		favorite = current_member.favorites.find_by(blog_id: blog.id)
		favorite.destroy
		redirect_to request.referer
    end
end
