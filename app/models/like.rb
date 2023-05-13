class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, counter_cache: :likes_count

  attribute :likes_count, :integer, default: 0

  def update_like_count
    update(likes_count: post.likes.count)
  end
end
