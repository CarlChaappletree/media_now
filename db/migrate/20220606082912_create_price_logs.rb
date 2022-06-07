class CreatePriceLogs < ActiveRecord::Migration[7.0]
  def change
    create_table :price_logs do |t|
      t.integer :price_cents, null: false
      t.integer :default_price_cents
      t.references :package, null: false, foreign_key: true
      t.references :location, foreign_key: true

      t.timestamps
    end
  end
end
