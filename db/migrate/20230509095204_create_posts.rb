# frozen_string_literal: true

# Run: rails db:migrate
class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false, limit: 50
      t.text :body, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    unless index_exists?(:posts, :user_id)
      add_index :posts, :user_id  
    end
  end
end

