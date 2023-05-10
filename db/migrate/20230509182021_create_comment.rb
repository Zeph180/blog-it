class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text, null: false, limit: 1000
      
      t.timestamps
    end
  end
end
