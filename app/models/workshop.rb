class Workshop < ApplicationRecord
  validates_presence_of :title, :description, :dates, :image
end
