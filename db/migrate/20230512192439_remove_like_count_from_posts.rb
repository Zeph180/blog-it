class RemoveLikeCountFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :like_count, :integer
  end
end
