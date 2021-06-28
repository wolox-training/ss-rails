class CreateBookSuggestions < ActiveRecord::Migration[6.1]
  def change
    create_table :book_suggestions do |t|
      t.string :synopsis
      t.float :price
      t.string :author, :null => false
      t.string :title, :null => false
      t.string :link, :null => false
      t.string :editor, :null => false
      t.string :year, :null => false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
