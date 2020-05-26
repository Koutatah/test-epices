class CreateDailyProductions < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_productions do |t|
      t.date :date
      t.integer :energy_production
    end
  end
end
