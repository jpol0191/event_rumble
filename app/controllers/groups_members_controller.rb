class GroupsMembersController < ApplicationController

	def create 
		@group_member=Group_Member.new(group_member_params)
		if @group_member
			#continue on to next page
		else 
			# handle errors here
		end 
	end 

	def update 
		@group_member=Group_Member.find(params[:id])
		@group_member.update
	end

	def destroy 
		@group_member=Group_Member.find(params[:id])
		@group_member.destroy
	end 
	
	private

	def group_member_params
		params.require(:group_member).permit(:group_id, :friend_id)
	end

end
