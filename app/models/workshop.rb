# frozen_string_literal: true

class Workshop < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances
  serialize :description
  serialize :menu
end
