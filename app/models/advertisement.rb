# frozen_string_literal: true

class Advertisement < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  has_one_attached :image

  belongs_to :establishment

  validates :title, presence: true, length: { minimum: 2 }
  validates :value, presence: true, numericality: { greater_than: 0 }
  validates :establishment, presence: true

  def load_image
    image.attached? ? image : 'no_image'
  end
end
