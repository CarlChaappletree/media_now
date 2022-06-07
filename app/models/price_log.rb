# frozen_string_literal: true

class PriceLog < ApplicationRecord
  belongs_to :package, optional: false
  belongs_to :location, optional: true

  validates :price_cents, presence: true
end
