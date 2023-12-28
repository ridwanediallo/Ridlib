class AddFormatToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :format, :string
  end
end
