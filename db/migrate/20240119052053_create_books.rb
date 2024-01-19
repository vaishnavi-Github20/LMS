class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :isbn
      t.string :title
      t.string :author
      t.string :language
      t.date :published
      t.string :edition
      t.string :associated_library
      t.string :cover_page
      t.text :summary
      t.boolean :special_collection

      t.timestamps
    end
  end
end
