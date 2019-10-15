class Advertisement < ApplicationRecord
  has_one_attached :image

  validates :title, presence: true, length: { minimum: 2 }
  validates :value, presence: true, numericality: { greater_than: 0 }
  validates :establishment, presence: true
end