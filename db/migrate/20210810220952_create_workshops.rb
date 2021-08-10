class CreateWorkshops < ActiveRecord::Migration[6.1]
  def change
    create_table :workshops do |t|
      t.string :title
      t.text :description
      t.text :dates, array: true, default: []
      t.string :image

      t.timestamps
    end
  end
end
