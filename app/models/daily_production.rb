class DailyProduction < ApplicationRecord
	has_many :hourly_productions
	has_many :inverters
end
