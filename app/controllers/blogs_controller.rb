class BlogsController < ApplicationController
	def new
		@blog = Blog.new
	end

	def create
		@blog = Blog.new(blog_params)
		@blog.member_id = current_member.id
		if @blog.save
      flash[:notice] = "新規投稿が完了しました"
      redirect_to blog_path(@blog.id)
    else
   		flash[:alert] = "入力内容に誤りがあります"
   		render :new
  	end
	end

	def index
		@blogs = Blog.page(params[:page]).per(5).order(created_at: :desc)
	end

	def show
		@blog = Blog.find(params[:id])
    @post_comment = PostComment.new
    @member = @blog.member
    @post_comments = @blog.post_comments
	end

	def edit
		@blog = Blog.find(params[:id])
	end

	def update
		@blog = Blog.find(params[:id])
    if @blog.update(blog_params)
    	flash[:notice] = "Blogを更新しました"
     	redirect_to blog_path(@blog)
    else
    	flash[:alert] = "入力内容に誤りがあります"
     	render :edit
    end
	end

	def destroy
		blog = Blog.find(params[:id])
    if blog.destroy
    	flash[:notice] = "Blogを削除しました"
    	redirect_to blogs_path
    else
    	flash[:alert] = "Blogを削除できませんでした"
    	rende :show
    end
	end

	def search
		@blogs = Blog.page(params[:page]).per(5).order(created_at: :desc).joins(:member).select('blogs.*','members.name')
    if params[:word].present?
        @blogs = @blogs.where('name LIKE ? or title LIKE ? or body LIKE ?', "%#{params[:word]}%", "%#{params[:word]}%", "%#{params[:word]}%")
   	end

    if params[:category].present?
      @blogs = @blogs.where(category: params[:category])
  	end
  	  render :index
  end

	private
	def blog_params
      params.require(:blog).permit(:image, :title, :body, :category, :member_id )

  end

end
