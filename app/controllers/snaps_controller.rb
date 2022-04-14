class SnapsController < ApplicationController
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :require_user_logged_in, only: [:edit, :update, :destroy]
  
  def index
    @snaps = Snap.all
  end

  def show
    @snap = Snap.find(params[:id])
    @comments = @snap.comments.all
    counts(@snap)
    
    if logged_in?
      @comment = current_user.comments.build
    end
  end

  def new
    @snap = current_user.snaps.build
  end

  def create
    @snap = current_user.snaps.build(snap_params)
    
    if @snap.save
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @snap.update(snap_params)
      redirect_to snap_path(@snap)
    else
      render :edit
    end
  end

  def destroy
    @snap.destroy
    redirect_to user_url(current_user)
  end
  
  def about
  end
  
  
  private
  
  def snap_params
    params.require(:snap).permit(:title, :description, :category_id, :image)
  end
  
  # ログインしているユーザの投稿でなければ、Topページに戻る
  def correct_user
    @snap = current_user.snaps.find_by(id: params[:id])
    
    unless @snap
      redirect_to root_url
    end
  end
end
