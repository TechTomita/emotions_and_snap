class FavoriteRelationshipsController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    snap = Snap.find(params[:snap_id])
    current_user.favorite(snap)
    redirect_to snap_url(snap)
  end

  def destroy
    snap = Snap.find(params[:snap_id])
    current_user.unfavorite(snap)
    redirect_to snap_url(snap)
  end
end
