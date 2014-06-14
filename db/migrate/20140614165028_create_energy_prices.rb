class CreateEnergyPrices < ActiveRecord::Migration
  def change
    create_table :energy_prices do |t|
      t.timestamp :timestamp
      t.float     :eur
    end
  end
end
