class UsersController < ApplicationController
  def index
    @users = User.all
    @posts = Post.where(author_id: @users.pluck(:id))
  end

  def show
    @user = User.find_by(id: params[:id])
    @logged_in_user = current_user
    @posts = Post.where(author_id: params[:id]).order(created_at: :desc).limit(3)
    @comments = Comment.where(post_id: @posts.pluck(:id))
    @likes = Like.where(post_id: @posts.pluck(:id))
  end
end
