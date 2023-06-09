class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id', dependent: :destroy
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, class_name: 'Like', foreign_key: 'author_id', dependent: :destroy

  validates :name, presence: true
  validates :posts_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def last_three_posts
    posts.last(3)
  end
end
