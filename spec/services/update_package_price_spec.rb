# frozen_string_literal: true
require "spec_helper"

RSpec.describe UpdatePackagePrice do
  it "updates the current price of the provided package" do
    package = Package.create!(name: "Dunderhonung")

    UpdatePackagePrice.call(package, 200_00)
    expect(package.reload.price_cents).to eq(200_00)
  end

  it "stores the old price of the provided package in its price log" do
    package = Package.create!(name: "Dunderhonung", price_cents: 100_00)

    UpdatePackagePrice.call(package, 200_00)
    expect(package.price_logs).to be_one
    price_log = package.price_logs.first
    expect(price_log.default_price_cents).to eq(100_00)
  end

  it "supports adding a price for a specific municipality" do
    package = Package.create!(name: "Dunderhonung")

    UpdatePackagePrice.call(package, 200_00, municipality: "Göteborg")

    expect(package.price_for("Göteborg")).to eq(200_00)
  end

  it "supports updating a price for a specific municipality" do
    package = Package.create!(name: "Dunderhonung")
    location = Location.create!(municipality: "Göteborg")
    Price.create!(price_cents: 100_00, location: location, package: package)

    UpdatePackagePrice.call(package, 200_00, municipality: "Göteborg")

    expect(package.price_for("Göteborg")).to eq(200_00)
    expect(package.prices).to be_one
  end
end
