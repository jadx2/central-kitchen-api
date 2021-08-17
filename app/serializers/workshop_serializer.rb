# frozen_string_literal: true

class WorkshopSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :menu, :dates, :image
end
