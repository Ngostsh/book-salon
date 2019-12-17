class ChangeNameColumnOnBook < ActiveRecord::Migration[5.2]
  def change
    change_column_null :books, :name, false
    change_column_null :books, :text, false
    change_column_null :books, :created_at, false
    change_column_null :books, :updated_at, false
    change_column_null :books, :user_id, false
  end
end
