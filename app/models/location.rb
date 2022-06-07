# frozen_string_literal: true

class Location < ApplicationRecord
  has_many :prices
  has_many :packages, through: :prices
  has_many :price_logs

  validates :municipality, presence: true, uniqueness: true
end
