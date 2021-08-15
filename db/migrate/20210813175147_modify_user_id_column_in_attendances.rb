# frozen_string_literal: true

# Migration to rename user_id column to attendee_id in attendances table
class ModifyUserIdColumnInAttendances < ActiveRecord::Migration[6.1]
  def change
    rename_column :attendances, :user_id, :attendee_id
  end
end
