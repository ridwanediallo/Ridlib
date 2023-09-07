class AddBookIdToBooks < ActiveRecord::Migration[7.0]
  def change
      add_column :books, :book_id, :integer
  end
end
