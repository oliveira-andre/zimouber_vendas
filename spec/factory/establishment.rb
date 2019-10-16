# frozen_string_literal: true

FactoryBot.define do
  factory :establishment do
    trading_name      { FFaker::Company.name }
    email             { FFaker::Internet.email }
    password          { 'secret123' }
  end
end
