# frozen_string_literal: true

class Establishment < ApplicationRecord
  extend FriendlyId
  friendly_id :trading_name, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :advertisements

  validates :trading_name, presence: true, length: { minimum: 2 }
end
