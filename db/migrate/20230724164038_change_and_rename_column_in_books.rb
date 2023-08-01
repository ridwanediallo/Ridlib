class ChangeAndRenameColumnInBooks < ActiveRecord::Migration[7.0]
  def change
      add_column :books, :subject, :string
      add_column :books, :download_count, :integer
      rename_column :books, :author_id, :user_id
      # remove_column :table_name, :old_column_name
  end
end
