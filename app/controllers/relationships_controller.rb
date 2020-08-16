class RelationshipsController < ApplicationController
	def create
	    current_member.follow(params[:member_id])
	    redirect_to request.referer
	end

	def destroy
	    current_member.unfollow(params[:member_id])
	    redirect_to request.referer
	end

	def follower
	    member = Member.find(params[:member_id])
	    @members = member.following_member
	end

	def followed
	    member = Member.find(params[:member_id])
	    @members = member.follower_member
	end
end
