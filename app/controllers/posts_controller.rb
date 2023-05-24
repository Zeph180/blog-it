class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
    @comments = Comment.where(post_id: params[:post_id])

    @posts.each do |post|
      @comments[post.id] = Comment.where(post_id: post.id)
    end

    @likes = Like.where(post_id: params[:post_id])
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find_by(id: @post.author_id)
    @logged_in_user = current_user
    @comments = Comment.where(post_id: @post.id)
    @likes = Like.where(post_id: params[:post_id])
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to user_path(@user), notice: 'Post created successfully.'
    else
      redirect_to user_path(@user), alert: 'Failed to create post.'
    end
  end
end
