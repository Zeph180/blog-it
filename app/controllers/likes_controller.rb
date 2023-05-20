class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    like = current_user.likes.build(post: @post)
    if like.save
      redirect_to @post, notice: 'Post liked!'
    else
      redirect_to @post, alert: 'Unable to like the post.'
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post: @post)
    if like
      like.destroy
      redirect_to @post, notice: 'Post unliked!'
    else
      redirect_to @post, alert: 'Unable to unlike the post.'
    end
  end
end
