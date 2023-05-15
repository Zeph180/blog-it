class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id', dependent: :destroy

  def last_three_posts
    posts.last(3)
  end
end
