class ChangeColumnQuestions < ActiveRecord::Migration
  def change
    change_column_null(:questions, :user_id, true)
  end
end
