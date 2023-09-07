class AddAuthorNameInBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :author_name, :string
  end
end
