class UserstoriesController < ApplicationController
	respond_to :html
	def index
		@userstories = Userstory.all
	end

	def new
		@userstory = Userstory.new
	end

	def create
		@userstory = Userstory.new(userstory_params)

		if @userstory.save
			redirect_to userstories_path :notice => "Uw Userstory is opgeslagen!"
		else
			render "new"
		end
	end

	def show
		@userstory = Userstory.find(params[:id])
	end

	def destroy
		@userstory = Userstory.find(params[:id])
		@userstory.destroy
		redirect_to userstories_path
	end

	private

	def userstory_params
		params.require(:userstory).permit(:content)
	end
end