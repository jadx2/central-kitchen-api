# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'ash@email.com' }
    password { 'password1' }
  end
end
