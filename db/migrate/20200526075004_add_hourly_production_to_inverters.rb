class AddHourlyProductionToInverters < ActiveRecord::Migration[6.0]
  def change
    add_reference :inverters, :hourly_production, null: false, foreign_key: true
  end
end
