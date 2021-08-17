# frozen_string_literal: true

class WorkshopSerializer < ActiveModel::Serializer
  attributes :title, :description, :menu, :dates, :image
end
