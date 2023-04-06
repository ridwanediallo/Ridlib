class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :author_id
      t.text :description
      t.date :publication_date
      t.string :image_url

      t.timestamps
    end
  end
end
