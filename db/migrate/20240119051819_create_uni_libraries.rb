class CreateUniLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :uni_libraries do |t|
      t.string :name
      t.string :university
      t.string :location
      t.integer :no_of_books
      t.float :overdue_fine

      t.timestamps
    end
  end
end
