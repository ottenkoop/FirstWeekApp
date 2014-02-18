class UserstoriesController < ApplicationController

	def index
		@userstories = Userstory.all
	end

	def new
		@userstory = Userstory.new
	end

	def create
		@userstory = Userstory.new(userstory_params)
	end

	private

	def userstory_params
		params.require(:userstories).permit(:content, :rating, :sprint_id)
	end
end