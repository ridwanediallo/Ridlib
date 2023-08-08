class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.string :user_id
      t.string :book_id
      t.integer :like_counts

      t.timestamps
    end
  end
end
