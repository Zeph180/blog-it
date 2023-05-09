# Frozen_string_literal: true

# Create table users with name, email, password_digest, photo_url, timestamps
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 50
      t.string :photo
      t.string :bio
      t.integer :posts_count, default: 0
      t.timestamps
    end
  end
end
