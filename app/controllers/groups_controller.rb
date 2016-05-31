class GroupsController < ApplicationController

	def create 
		@group=Group.new(group_params)
		if @group.save
			@members = params[:group][:fname].split(',')
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
		params.require(:group).permit(:users, :user_id, :name)
	end
end
