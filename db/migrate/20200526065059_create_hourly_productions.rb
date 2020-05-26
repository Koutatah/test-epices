class CreateHourlyProductions < ActiveRecord::Migration[6.0]
  def change
    create_table :hourly_productions do |t|
      t.datetime :date
      t.integer :energy_production
    end
  end
end
