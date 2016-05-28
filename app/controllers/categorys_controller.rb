class CategorysController < ApplicationController

	def create 
		@category=Category.new(category_params)
		if @category.save
			# continue to next page
		else 
			# handle errors 
		end 
	end

	def update 
		@category=Category.find(params[:id])
		@category.update(category_params)
	end

	def destroy
		@category=Category.find(params[:id])
		@category.destroy
	end

	private 

	def category_params
		params.require(:category).permit(:name)
end
