class UserstoriesController < ApplicationController

	def index
		@userstories = Userstories.all
	end

	def new
		@userstory = Userstories.new
	end

	def create
		@userstory = Userstories.new(userstories_params)
		@userstory.save
	end

	private

	def userstories_params
		params.require(:userstories).permit(:content, :rating, :sprint_id)
	end
end