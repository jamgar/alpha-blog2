class UsersController < ApplicationController
  before_action :find_user, only: [:edit, :update, :show, :destroy]
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def show
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the alpha blog #{@user.username}"
      redirect_to articles_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  
  private
    def find_user
      @user = User.find(params[:id])  
    end
    
    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end