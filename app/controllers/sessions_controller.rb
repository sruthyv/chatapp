class SessionsController < ApplicationController
  def create
    user = User.create(username: params[:session][:username],
                       email: params[:session][:email])
    if user
      log_in(user)
    else
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end
