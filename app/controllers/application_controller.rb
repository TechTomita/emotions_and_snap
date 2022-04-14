class ApplicationController < ActionController::Base
  include SessionsHelper
  
  helper_method :counts
  
  private
  
  # ログイン要求
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(snap)
    @count_favorite = snap.favorite_users.count
  end
end
