class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
    @comments = Comment.where(post_id: params[:post_id])
    @likes = Like.where(post_id: params[:post_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find_by(id: @post.author_id)
    @logged_in_user = current_user
    @comments = Comment.where(post_id: params[:post_id])
    @likes = Like.where(post_id: params[:post_id])
  end
end
