# frozen_string_literal: true

class Workshop < ApplicationRecord
  has_many :attendances
  has_many :attendees, through: :attendances, class_name: 'User', foreign_key: :user_id
  serialize :description
  serialize :menu
end
