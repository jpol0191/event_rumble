class GroupsController < ApplicationController
	def show
		@group = Group.find(params[:id])
		@groupmembers = GroupMember.where(group_id: @group.id) || []
		@members = []
		@groupmembers.each do |g|
			@members << User.find(g.user_id)
		end
	end

	def create 
		@group=Group.new(group_params)
		if @group.save
			@members = params[:group][:fname].split(',')
			@members.each do |member|
				if @invited = User.where(email: member).first
					mem = GroupMember.new(group_id: @group.id, user_id: @invited.id, friend_id: 1 )
					mem.save
				end
			end
			redirect_to group_path(@group.id)
		else 
			redirect_to :back
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
