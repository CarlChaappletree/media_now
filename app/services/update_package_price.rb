# frozen_string_literal: true

class UpdatePackagePrice
  def self.call(package, new_price_cents, **options)
    Package.transaction do
      location = Location.find_or_create_by(municipality: options[:municipality])
      price_with_location = package.prices.find_by(location: location)

      if price_with_location.present?
        price_with_location.update!(price_cents: new_price_cents)
      else
        Price.create!(package: package, price_cents: new_price_cents, location: location)
      end

      PriceLog.create!(package: package, price_cents: new_price_cents, default_price_cents: package.price_cents, location: location)
      Package.update!(price_cents: new_price_cents)
    end
  end
end
