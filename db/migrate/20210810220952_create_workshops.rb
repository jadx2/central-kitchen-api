# frozen_string_literal: true

# Migration to create workshop table
class CreateWorkshops < ActiveRecord::Migration[6.1]
  def change
    create_table :workshops do |t|
      t.string :title
      t.text :description
      t.text :menu
      t.text :dates, array: true, default: []
      t.string :image

      t.timestamps
    end
  end
end
