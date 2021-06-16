class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :author, :null => false
      t.string :image, :null => false
      t.string :title, :null => false
      t.string :year, :null => false
      t.string :editor, :null => false
      t.string :book_genre, :null => false

      t.timestamps
    end
  end
end
