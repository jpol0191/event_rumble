class PowerUpsController < ApplicationController

	def create
		@power_up = Power_up.new(power_up_params)

		if @power_up.save
			#continue to next page
		else
			#error handling 
		end
	end

	def update
		@power_up = Power_up.find(params[:id])
		@power_up.update(power_up_params)
	end 

	def destroy
		@power_up = Power_up.find(params[:id])
		@power_up.destroy
	end

	private

	def power_up_params
		params.require(:power_up).permit(:user_id, :name, :desc)
	end
end
