class ChangeColumnToReview < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :image, :text, default: "default_book_image.png" 
  end
end