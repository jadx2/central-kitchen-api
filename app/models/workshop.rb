# frozen_string_literal: true

class Workshop < ApplicationRecord
  serialize :description
  serialize :menu
end
