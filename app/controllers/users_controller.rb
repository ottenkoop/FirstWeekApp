class UsersController < ApplicationController

  before_filter :current_user, only: [:login]

  def create
    @user = User.new(userparams)

    if @user.save
      redirect_to login_path
    elsif @user.errors[:username]
      redirect_to register_path, notice: 'Email has already taken'
    else
      redirect_to register_path, notice: 'Something went wrong'
    end
  end

  def register
    @login_page = true
    session[:user_id] = nil
    @user = User.new
  end

  def login
    @login_page = true
  end

  def login_user
    user = User.find_by_username(params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/', notice: "Logged in"
    else
      redirect_to '/login', alert: "Email or password is invalid"
    end
  end

  def logout_user
    session[:user_id] = nil
    redirect_to '/login', notice: "You have been logged out"
  end

  private

  def userparams
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
