# frozen_string_literal: true

require "spec_helper"

RSpec.describe Price do
  it "validates the presence of price_cents" do
    price = Price.new
    expect(price.validate).to eq(false)
    expect(price.errors[:price_cents]).to be_present
  end

  it "belongs to package location" do
    should belong_to(:location)
  end

  it "belongs to package" do
    should belong_to(:package)
  end
end
