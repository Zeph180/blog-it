class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'

  def update_comment_count
    post.update(comments_count: post.comments.count)
  end
end
