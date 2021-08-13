class AddDateForAttendance < ActiveRecord::Migration[6.1]
  def change
    add_column :attendances, :date, :string
  end
end
