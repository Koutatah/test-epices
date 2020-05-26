require 'csv'
require 'set'

class ProductionsController < ApplicationController
	def index
		@daily_productions = DailyProduction.all
	end

	def new
	end

	def create
		@daily_production = DailyProduction.new(energy_production: 0)
		inverters_id = Set[]
		inverters = []
		hourly_productions = []
		datetime = nil

		CSV.foreach(params[:file].path, headers:true) do |row|
			inverter_id = row["identifier"].to_i
			inverters_id.add({inverter_id: inverter_id})
			datetime = DateTime.strptime(row["datetime"], "%d/%m/%y %H:%M")
			hourly_productions << {
				inverter_id: inverter_id,
				datetime: datetime,
				energy_production: row["energy"].to_i
			}
			@daily_production.energy_production += row["energy"].to_i
		end
		@daily_production.date = datetime.to_date
		ActiveRecord::Base.transaction do
			for inverter_id in inverters_id do
				inverters << Inverter.find_or_create_by(id: inverter_id)
			end
			@daily_production.hourly_productions.build(hourly_productions)
			@daily_production.save
			@daily_production.inverters << inverters
		end

		redirect_to production_path(@daily_production.id)
	end

	def show
		@daily_production = DailyProduction.find(params[:id])
	end
end
