class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_posts = User.find(params[:id]).posts.paginate(page: params[:page], per_page: 3)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Welcome to the Sample App!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :username,
                                 :password, :password_confirmation)
  end
end
