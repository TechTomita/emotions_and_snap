class ApplicationController < ActionController::Base
  include SessionsHelper
  
  private
  
  # ログイン要求
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def count(snap)
    @count_favorite = snap.favorite_users.count
  end
end
