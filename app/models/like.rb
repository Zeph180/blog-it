class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_like_count
    update(like_count: likes.count)
  end
end
