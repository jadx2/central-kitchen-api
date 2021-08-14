class ModifyWorkshopIdColumnInAttendances < ActiveRecord::Migration[6.1]
  def change
    rename_column :attendances, :workshop_id, :attended_workshop_id
  end
end
