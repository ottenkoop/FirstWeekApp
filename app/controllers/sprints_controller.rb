class SprintsController < ApplicationController

  def index
    @sprints = Sprint.all
  end

  def new
    @sprint = Sprint.new
  end

  def create
    @sprint = Sprint.new(sprintparams)

    if @sprint.save
      redirect_to root_path, notice: "New Sprint Added"
    else
      render 'new', alert: "Someting went wrong"
    end
  end

  private

  def sprintparams
    params.require(:sprint).permit(:name, :goal, :start_date, :end_date)
  end
end
