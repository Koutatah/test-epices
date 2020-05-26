class DailyProduction < ApplicationRecord
	has_many :hourly_productions
	has_and_belongs_to_many :inverters

	validates :energy_production, :presence => true
	validates :energy_production, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

	validates :date, :presence => true
end
