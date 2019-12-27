class UsersController < ApplicationController
  def new; end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_posts = User.find(params[:id]).posts.paginate(page: params[:page], per_page: 4)
  end

  def user_params
    params.require(:user).permit(:name, :email, :username)
  end
end
