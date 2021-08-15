# frozen_string_literal: true

# Migration to add password_digest
class AddPasswordDigestToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :password_digest, :string
  end
end
