class ChangeUserToBeOptionalInBookSuggestions < ActiveRecord::Migration[6.1]
  def change
    change_column :book_suggestions, :user_id, :integer, null: true
  end
end
