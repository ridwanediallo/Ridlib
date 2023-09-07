class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.text :bio
      t.date :createdAt
      t.date :updatedAt

      t.timestamps
    end
  end
end
