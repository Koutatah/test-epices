class Inverter < ApplicationRecord
	has_many :hourly_productions
	has_many :daily_productions
end
