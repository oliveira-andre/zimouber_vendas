# frozen_string_literal: true

class Advertisement < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one_attached :image

  validates :title, presence: true, length: { minimum: 2 }
  validates :value, presence: true, numericality: { greater_than: 0 }
  validates :establishment, presence: true
end
