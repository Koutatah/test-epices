class HourlyProduction < ApplicationRecord
	belongs_to :hourly_production
	belongs_to :inverter

	validates :energy_production, :presence => true
	validates :games_played, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
