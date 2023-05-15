class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: params[:id]).order(created_at: :desc)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
  end
end
