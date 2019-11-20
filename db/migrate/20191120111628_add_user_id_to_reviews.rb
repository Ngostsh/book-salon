class ChangeColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :user_id, :integer, null: false, foreign_key: true
  end
end