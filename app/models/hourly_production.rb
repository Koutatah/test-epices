class HourlyProduction < ApplicationRecord
	belongs_to :daily_production
	belongs_to :inverter

	validates :energy_production, :presence => true
	validates :energy_production, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

	validates :datetime, :presence => true

end
