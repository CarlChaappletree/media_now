# frozen_string_literal: true

require "spec_helper"

RSpec.describe Location do
  it "validates the presence of municipality" do
    location = Location.new(municipality: nil)
    expect(location.validate).to eq(false)
    expect(location.errors[:municipality]).to be_present
  end

  it "has many prices" do
    should have_many(:prices)
    should have_many(:price_logs)
    should have_many(:packages).through(:prices)
  end

  it "validates unique municipality" do
    should validate_uniqueness_of(:municipality)
  end
end
