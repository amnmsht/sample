class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
      
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
          if @user.save
            redirect_to user_path(@user.id)
        else
            render 'new'
          end
        end

    def show
        #@user = User.find(params[:id])
        @favorite_blogs = @user.favorites
    end
    
    def edit
      #@user = User.find(params[:id])
    end
    
    def update
     # @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "ユーザーを編集しました!"
      redirect_to user_path
    end    
    end

  def user_params
      params.require(:user).permit(:name,:email,:password,:password_digest,:image)
end
end

  private
  
  def set_user
     @user = User.find(params[:id])
  end


