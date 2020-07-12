# frozen_string_literal: true

FactoryBot.define do
  factory :guideline do
    sequence(:title) { |n| "title#{n}" }
  end
end
