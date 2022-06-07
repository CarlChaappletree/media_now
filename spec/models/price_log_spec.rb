# frozen_string_literal: true

require "spec_helper"

RSpec.describe PriceLog do
  it "validates the presence of price_cents" do
    price_log = PriceLog.new
    expect(price_log.validate).to eq(false)
    expect(price_log.errors[:price_cents]).to be_present
  end

  it "belongs to package location" do
    should belong_to(:location).optional
  end

  it "belongs to package" do
    should belong_to(:package)
  end
end
