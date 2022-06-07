# frozen_string_literal: true

class Package < ApplicationRecord
  has_many :prices, dependent: :destroy
  has_many :locations, through: :prices
  has_many :price_logs

  validates :name, presence: true, uniqueness: true
  validates :price_cents, presence: true

  def price_for(location_param)
    location = Location.find_by(municipality: location_param)
    prices.where(location: location).first.price_cents
  end
end
