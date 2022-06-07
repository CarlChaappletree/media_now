# frozen_string_literal: true

class PriceHistory
  def self.call(package:, year:, **options)
    obj = {}
    locations = package.locations
    locations = locations.where(municipality: options[:municipality]) if options[:municipality].present?
    locations.each do |l|
      l.price_logs.where("cast(strftime('%Y', created_at) as int) = ?", year).each do |p|
        if obj[l.municipality]
          obj[l.municipality] << p.price_cents
        else
          obj[l.municipality] = [p.price_cents]
        end
      end
    end
    obj
  end
end
