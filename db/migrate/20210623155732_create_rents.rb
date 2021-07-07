class CreateRents < ActiveRecord::Migration[6.1]
  def change
    create_table :rents do |t|
      t.references :user, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.date :start_of_rent, null: false
      t.date :end_of_rent, null: false
      
      t.timestamps
    end
  end
end
