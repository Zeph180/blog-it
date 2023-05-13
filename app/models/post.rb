class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes, class_name: 'Like', foreign_key: 'post_id', dependent: :destroy

  def update_posts_count
    author = User.find(author_id)
    author.update(posts_count: author.posts.count)
  end

  def last_five_comments
    comments.last(5)
  end
end
