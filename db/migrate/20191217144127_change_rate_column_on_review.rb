class ChangeRateColumnOnReview < ActiveRecord::Migration[5.2]
  def change
    change_column_null :reviews, :rate, false
    change_column_null :reviews, :review, false
  end
end
