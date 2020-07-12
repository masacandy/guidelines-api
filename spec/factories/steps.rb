# frozen_string_literal: true

FactoryBot.define do
  factory :step do
    sequence(:title) { |n| "title#{n}" }
    sequence(:position) { |n| n }
  end
end
