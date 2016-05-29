class PowerUpsController < ApplicationController

	def create
		@power_up = Power_up.new(power_up_params)

		if @power_up.save
			redirect_to :back
		else
			redirect_to :back
		end
	end

	def update
		@power_up = Power_up.find(params[:id])
		@power_up.update(power_up_params)
		redirect_to :back
	end 

	def destroy
		@power_up = Power_up.find(params[:id])
		@power_up.destroy
		redirect_to :back
	end

	private

	def power_up_params
		params.require(:power_up).permit(:user_id, :name, :desc)
	end
end
