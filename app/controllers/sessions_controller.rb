class SessionsController < ApplicationController
  skip_before_action:login_required,only:[:new,:create]
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
      # log_in user
      # redirect_to user
    else
      flash.now[:danger] = 'fail login'
      render:new
    end
  end
  def destroy
    session.delete(:user_id)
    flash[:notice] = 'Logout'
    redirect_to new_session_path
  end
end
