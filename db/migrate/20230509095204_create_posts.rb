# frozen_string_literal: true

# Run: rails db:migrate
class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false, limit: 50
      t.text :text, null: false
      t.integer :likes_count, default: 0
      t.integer :comments_count, default: 0
      t.bigint :author_id
      t.timestamps
    end
    unless index_exists?(:posts, :author_id)
      add_index :posts, :author_id  
    end
  end
end

