class UsersController < ApplicationController
  def new; end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :username)
  end
end
