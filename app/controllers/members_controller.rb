class MembersController < ApplicationController
	def show
    	@member = Member.find(params[:id])
      @blogs = @member.blogs
      @photos = @member.photos
  	end

  	def edit
    	  @member = Member.find(current_member.id)
  	end

    def blog
      @member = Member.find(params[:id])
      @blogs = @member.blogs
    end

    def photo
      @member = Member.find(params[:id])
      @photos = @member.photos
    end

  	def update
    	@member = Member.find(params[:id])
    	if 	@member.update(member_params)
      		flash[:notice] = "登録情報を更新しました！"
      		redirect_to member_show_path(params[:id])
    	else
      		render :edit
      end
  	end
  	def member_params
    	params.require(:member).permit(:name, :email, :password, :introduction, :profile_image )
  	end
end
