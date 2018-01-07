class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :set_current_user, only: [:new, :edit, :show]
  
  def top#12/15追加
  end
  
  def index
    @blogs = Blog.all.order(created_at: :desc)
  end

def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end
  
   def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid? #バリデーションを設定している
  end
    
  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      #redirect_to blogs_path, notice: "ブログを作成しました！"←二重の表示を避けてflash化#
      flash[:success] = "ブログを作成しました!"
      redirect_to blogs_path          
    else
      render 'new'
    end
  end
  
  def show
    #@blog = Blog.find(params[:id])←共通化した部分の記述は削除。
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end
  
  def edit
    #@blog = Blog.find(params[:id])←共通化した部分の記述は削除。
  end
  
  def destroy
    @blog.destroy #取得した値を削除する
    #redirect_to blogs_path,notice:"ブログを削除しました！"#
      flash[:success] = "ブログを削除しました!"
      redirect_to blogs_path    
  end
  
  def update
    #@blog = Blog.find(params[:id])←共通化した部分の記述は削除。
    if @blog.update(blog_params)
      #redirect_to blogs_path, notice: "ブログを編集しました!"#
      flash[:success] = "ブログを編集しました!"
      redirect_to blogs_path
      
      
    else
      render 'edit'
    end
  end
  
  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end
  
  def set_blog
     @blog = Blog.find(params[:id])
  end
  
       def set_current_user
         unless logged_in?
         flash[:warning] = 'ログインして下さい'#:notoceだとフラッシュが機能しないので:warningに変更
         redirect_to new_session_path
    end
  end
end