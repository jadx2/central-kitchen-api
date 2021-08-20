class RemoveMenuFromWorkshop < ActiveRecord::Migration[6.1]
  def change
    remove_column :workshops, :menu
  end
end
