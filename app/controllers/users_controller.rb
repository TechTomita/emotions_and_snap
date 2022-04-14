class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @my_snaps = @user.snaps.all
    @favorite_snaps = @user.favorite_snaps.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      redirect_to login_url
    else
      render :new
    end
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
