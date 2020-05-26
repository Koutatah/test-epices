class CreateJoinTableDailyProductionsInverters < ActiveRecord::Migration[6.0]
  def change
    create_join_table :daily_productions, :inverters do |t|
      t.index [:daily_production_id, :inverter_id], name: "index_daily_productions_inverters"
      t.index [:inverter_id, :daily_production_id], name: "index_daily_inverters_productions"
    end
  end
end
