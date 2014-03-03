class UserstoriesController < ApplicationController
	respond_to :html
	def index
		@userstories = Userstory.all
	end

	def new
		@sprint = Sprint.find(params[:sprint_id])
		@userstory = Userstory.new

	end

	def create
		@userstory = Userstory.new(userstory_params)

		if @userstory.save
			redirect_to sprints_path :notice => "Uw Userstory is opgeslagen!"
		else
			render "new"
		end
	end

	def show
		@userstory = Userstory.find(params[:id])
	end

	def edit
		@sprint = Sprint.find(params[:sprint_id])
		@userstory = Userstory.find(params[:id])
	end

	def update
		@userstory = Userstory.find(params[:id])

			if @userstory.update_attributes(userstory_params)
				redirect_to '/', :notice => "Uw Userstory is gewijzigd"
			else
				render "edit"
			end
	end

	def update_ranking
    if params.key?(:userstory)
      Userstory.update(params[:userstory].keys, params[:userstory].values)
      redirect_to '/'
    else
      redirect_to '/recent/edit',
      notice: 'No Files were selected to upload!'
    end
	end

	def destroy
		@userstory = Userstory.find(params[:id])
		@userstory.destroy
		redirect_to '/'
	end

	private

	def userstory_params
		params.require(:userstory).permit(:content, :sprint_id, :ranking)
	end
end