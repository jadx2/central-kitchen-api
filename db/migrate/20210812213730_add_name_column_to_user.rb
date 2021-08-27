# Migration to add a username column in users table
class AddNameColumnToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
  end
end
