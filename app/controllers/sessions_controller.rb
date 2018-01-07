class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:warning] = 'ログインに失敗しました'
      redirect_to new_session_path
    end
  end
  
  def destroy
    session.delete(:user_id)
    flash[:success] = 'ログアウトしました'#:noticeだとbootstrapが機能しないので:warningに変更
    redirect_to new_session_path
 end 
end
