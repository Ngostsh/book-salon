class RenameReviewsToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_table :reviews, :books
  end
end