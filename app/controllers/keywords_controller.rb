class KeywordsController < ApplicationController

	def create 
		@keyword=Keyword.new(keyword_params)

		if @keyword.save
			#continue to next page
		else
			#handle errors
		end
	end

	def update 
		@keyword=Keyword.find(params[:id])
		@keyword.update(keyword_params)
	end

	def destroy 
		@keyword=Keyword.find(params[:id])
		@keyword.destroy
	end

	private 

	def keyword_params
		params.require(:keyword).permit(:category_id, :name)
	end
end
