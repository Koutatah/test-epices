class AddDailyProductionToHourlyProductions < ActiveRecord::Migration[6.0]
  def change
    add_reference :hourly_productions, :daily_production, null: false, foreign_key: true, index: true
  end
end
