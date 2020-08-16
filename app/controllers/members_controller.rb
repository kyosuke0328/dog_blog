class MembersController < ApplicationController
	def show
    	@member = Member.find(current_member.id)
  	end

  	def edit
    	@member = Member.find(current_member.id)
  	end

  	def update
    	@member = Member.find(params[:id])
    	if 	@member.update(member_params)
      		flash[:notice] = "登録情報を更新しました！"
      		redirect_to member_show_path
    	else
      		render :edit
    end
  	end
	def follows

  	end

  	def followers

  	end
  	def member_params
    	params.require(:member).permit(:name, :email, :password )
  	end
end
