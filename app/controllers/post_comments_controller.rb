class PostCommentsController < ApplicationController
  before_action :authenticate_member!
	def create
   		blog = Blog.find(params[:blog_id])
    	comment = current_member.post_comments.new(post_comment_params)
      comment.blog_id = blog.id
      if  comment.save
    	    redirect_to blog_path(blog)
      else
        redirect_to blog_path(blog), alert: 'コメントを入力してください'
      end
  end

	def destroy
  	PostComment.find_by(id: params[:id], blog_id: params[:blog_id]).destroy
  	redirect_to blog_path(params[:blog_id])
   end

  private
  def post_comment_params
    	params.require(:post_comment).permit(:comment, :blog_id ).merge(member_id: current_member.id)
  end
end
