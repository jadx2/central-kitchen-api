# Migration to add date column in attendances table
class AddDateForAttendance < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :date, :string
  end
end
