class ChangeStudentListUserIdBackToInt < ActiveRecord::Migration[7.0]
  def change
    change_column :student_lists, :user_id, :integer
  end
end
