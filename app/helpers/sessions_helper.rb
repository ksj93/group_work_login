module SessionsHelper
  def current_user
    @currrent_user ||=User.find_by(id: session[:user_id])
  end
  def logged_in?
    current_user.present?
  end
end
