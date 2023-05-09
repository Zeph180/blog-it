# Frozen_string_literal: true

# Create table users with name, email, password_digest, photo_url, timestamps
class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 50
      t.string :email, null: false, limit: 50
      t.string :password_digest, null: false
      t.string :photo_url
      t.timestamps
    end
  end
end
