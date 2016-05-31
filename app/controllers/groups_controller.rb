class GroupsController < ApplicationController

	def create 
		@group=Group.new(group_params)
		if @group.save
			@members = params[:group][:fname].split(',')
			@members.each do |member|
				@invited = User.where(fname: member).first
				mem = GroupMember.new(group_id: 1, user_id: @invited.id, friend_id: 1 )
				mem.save
			end
			redirect_to :back
		else 
			#handle errors
		end 
	end

	def update 
		@group=Group.find(params[:id])
		@group.update(group_params)
	end

	def destroy 
		@group=Group.find(params[:id])
		@group.destroy
	end

	private 

	def group_params
		params.require(:group).permit(:user_id, :name)
	end
end
