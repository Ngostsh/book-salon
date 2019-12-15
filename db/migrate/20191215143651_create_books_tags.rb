class CreateBooksTags < ActiveRecord::Migration[5.2]
  def change
    create_table :books_tags do |t|
      t.integer :book_id, null: false, foreign_key: true
      t.integer :tag_id, null: false, foreign_key: true
    end
  end
end