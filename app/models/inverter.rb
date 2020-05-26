class Inverter < ApplicationRecord
	has_many :hourly_productions
	has_and_belongs_to_many :daily_productions
end
