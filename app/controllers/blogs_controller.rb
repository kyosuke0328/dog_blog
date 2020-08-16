class BlogsController < ApplicationController
	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)
		# @blog.member_id = current_member.id
		if
			@blog.save
         	flash[:notice] = "Blog was successfully created."
         	redirect_to blog_path(@blog.id)
        else
            # @member = current_member
         	@blogss = Blog.all
         	render 'index'
        end
	end

	def index
		@blogs = Blog.all
        # @member = @blog.member
	end

	def show
		@blog = Blog.find(params[:id])
        @post_comment = PostComment.new
        # @member = @blog.member
        # @post_comments = @blog.post_comments
	end
	def edit
		@bog = Blog.find(params[:id])
        if @blog.member.id != current_member.id
           redirect_to blogs_path
        end
	end
	def update
		@blog = Blog.find(params[:id])
        if @blog.update(blog_params)
        	flash[:notice] = "Blog was successfully created."
         	redirect_to blog_path(@blog)
        else
         	render 'edit'
        end
	end
	def destroy
		blog = Blog.find(params[:id])
        blog.destroy
    	redirect_to blogs_path
	end
	private
	def blog_params
      params.require(:blog).permit(:image, :title, :body )

  	end
end
