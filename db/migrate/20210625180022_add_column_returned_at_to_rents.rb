class AddColumnReturnedAtToRents < ActiveRecord::Migration[6.1]
  def change
    add_column :rents, :returned_at, :date
  end
end
