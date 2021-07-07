class AddColumnTimesRentedToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :times_rented, :integer, :default => 0
  end
end
