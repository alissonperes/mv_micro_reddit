class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user&.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid username/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def current_user
    return @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end
