class AddOvertimeInstructorToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :overtime, :string
    add_column :attendances, :instructor, :string
  end
end
