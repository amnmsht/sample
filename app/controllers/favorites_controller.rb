class FavoritesController < ApplicationController
    def create
    favorite = current_user.favorites.create(blog_id: params[:blog_id])
    flash[:success] = "#{favorite.blog.user.name}さんのブログをお気に入り登録しました"
    redirect_to blogs_url
  end
  
  def destroy
    favorite = current_user.favorites.find_by(blog_id: params[:blog_id]).destroy
    flash[:warning] = "#{favorite.blog.user.name}さんのブログをお気に入り解除しました"
    redirect_to blogs_url
  end
end
