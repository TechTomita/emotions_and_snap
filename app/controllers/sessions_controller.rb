class SessionsController < ApplicationController
  def new
  end

  def create
    # ログインページで入力されたメールアドレスとパスワードを取得
    email = params[:session][:email].downcase
    password = params[:session][:password]
    
    if login(email, password)
      redirect_to @user
    else
      flash.now[:danger] = "ログインに失敗しました。"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_url
  end
  
  
  private
  
  # ログインしていればtrue, していなければfalse
  def login(email, password)
    # ログインページで入力されたメールアドレスでユーザを検索
    @user = User.find_by(email: email)
    
    # ユーザが存在して、ログインページで入力されたパスワードがユーザのものと一致したらログイン成功
    if @user && @user.authenticate(password)
      # ユーザidをセッションに代入
      session[:user_id] = @user.id
      return true
    else
      return false
    end
  end
  
end
