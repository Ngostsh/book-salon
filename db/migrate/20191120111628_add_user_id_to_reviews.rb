class ChangeColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :user_id, :integer, null: false, foreign_key: true
  end
end