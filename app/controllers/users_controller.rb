class UsersController < ApplicationController
  skip_before_action:login_required,only:[:new,:create]
  def new
    @user = User.new
  end
  def create
    @user =User.new(user_params)


    if User.count >0
      if User.find_by(params[:eamil]).email != User.new(params.require(:user).permit(:email)).email
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user.id)
        else
          render:new
        end
      else
        render:new
      end
    else
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    end


  end
  def show
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end
