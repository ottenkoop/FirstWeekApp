class SprintsController < ApplicationController

  before_filter :authorize

  def index
    @user = User.find(session[:user_id])

    @sprints = @user.sprints
  end

  def new
    @sprint = Sprint.new
  end

  def create
    @sprint = Sprint.new(sprintparams)

    if @sprint.save
      redirect_to root_url, notice: "New Sprint Added"
    else
      render 'new', alert: "Someting went wrong"
    end
  end

  def edit
    @sprint = Sprint.find(params[:id])
  end

  def update
    @sprint = Sprint.find(params[:id])

    if @sprint.update(params[:sprint].permit(:name, :goal, :start_date, :end_date))
      redirect_to root_path, notice: "Sprint edited"
    else
      render 'edit', alert: "Someting went wrong"
    end
  end

  def destroy
    sprint = Sprint.find(params[:id])
    sprint.destroy

    redirect_to '/', notice: 'Sprint has been deleted'
  end

  private

  def sprintparams
    params.require(:sprint).permit(:name, :goal, :start_date, :end_date, :user_id)
  end
end
