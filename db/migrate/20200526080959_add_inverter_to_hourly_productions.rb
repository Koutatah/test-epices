class AddInverterToHourlyProductions < ActiveRecord::Migration[6.0]
  def change
    add_reference :hourly_productions, :inverter, null: false, foreign_key: true
  end
end
