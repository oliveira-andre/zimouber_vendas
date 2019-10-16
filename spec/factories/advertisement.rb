# frozen_string_literal: true

FactoryBot.define do
  factory :advertisement do
    heading          { FFaker::LoremFR.sentence }
    value            { 111 }
    establishment
  end
end
