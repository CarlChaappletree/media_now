# frozen_string_literal: true

class UpdatePackagePrice
  def self.call(package, new_price_cents, **options)
    Package.transaction do
      location = Location.find_or_create_by(municipality: options[:municipality])
      price_with_location = package.prices.find_by(location: location)
      # Add a price depending on a municipality
      if price_with_location.present?
        price_with_location.update!(price_cents: new_price_cents)
      else
        # TODO: After defining the package.price_cents, price.location should not allow null
        Price.create!(package: package, price_cents: new_price_cents, location: location)
      end

      PriceLog.create!(package: package, price_cents: new_price_cents, default_price_cents: package.price_cents, location: location)
      # Update the current price
      # TODO: What municipality package.price_cents represent?
      Package.update!(price_cents: new_price_cents)
    end
  end
end
