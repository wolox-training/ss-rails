class ChangeColumnTitleFromBooks < ActiveRecord::Migration[6.1]
  def change
    change_column :books, :title, :string, :limit => 25
    Book.all.each do |book|
      if book.title.length > 25
        book.title = book.title.truncate(25)
      end
    end
  end
end
