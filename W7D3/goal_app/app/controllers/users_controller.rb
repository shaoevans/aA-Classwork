class UsersController < ApplicationController
  before_action :require_logged_in, only: [:show, :index]
  def new
    render :new
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def create
    
    @user = User.new(user_params)
    
    if @user.save
      
      login!(@user)
      redirect_to users_url
    else
      flash.now[:errors] = @user.errors.full_messages
      # redirect_to new_user_url
      render :new
    end
  end

  def index
    @users = User.all
    render :index
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
