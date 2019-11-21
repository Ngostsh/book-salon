class ChangeColumnDefaultToReview < ActiveRecord::Migration[5.2]
  def change
    change_column_default :reviews, :image, from: "default_book_image.png", to: nil
  end
end
