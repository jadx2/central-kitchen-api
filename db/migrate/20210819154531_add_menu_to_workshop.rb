# frozen_string_literal: true

class AddMenuToWorkshop < ActiveRecord::Migration[6.1]
  def change
    add_column :workshops, :menu, :text, array: true, default: []
  end
end
