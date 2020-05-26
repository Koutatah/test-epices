require 'rails_helper'

RSpec.describe HourlyProduction, type: :model do
  let(:good_energy_production) { 100 }
  let(:inverter) { Inverter.create! }
  let(:bad_energy_production) { -1 }
  let(:datetime) { DateTime.current }
  let(:daily_production) { 
    DailyProduction.create!(
      energy_production: 100,
      date: DateTime.current.to_date
    )
  }

  context 'Testing save and validation of a daily_production' do
    it "should save" do
      hourly_production = HourlyProduction.new(
        inverter_id: inverter.id,
        energy_production: good_energy_production,
        daily_production_id: daily_production.id,
        datetime: datetime
      )
      hourly_production.save

      expect(hourly_production).to be_persisted
    end

    it "should not save because energy_production not provide" do
      hourly_production = HourlyProduction.new(
        inverter_id: inverter.id,
        daily_production_id: daily_production.id,
        datetime: datetime
      )
      hourly_production.save()
      expect(hourly_production).not_to be_valid
    end

    it "should not save because energy_production are less than zero" do
      hourly_production = HourlyProduction.new(
        energy_production: bad_energy_production,
        inverter_id: inverter.id,
        daily_production_id: daily_production.id,
        datetime: datetime
      )
      hourly_production.save()
      expect(hourly_production).not_to be_valid
    end

    it "should not save because datetimetime not provide" do
      hourly_production = HourlyProduction.new(
        inverter_id: inverter.id,
        energy_production: good_energy_production,
        daily_production_id: daily_production.id
      )
      hourly_production.save()
      expect(hourly_production).not_to be_valid
    end

    it "should not save because inverter not provide" do
      hourly_production = HourlyProduction.new(
        energy_production: good_energy_production,
        daily_production_id: daily_production.id,
        datetime: datetime
      )
      hourly_production.save()
      expect(hourly_production).not_to be_valid
    end

    it "should not save because daily_production not provide" do
      hourly_production = HourlyProduction.new(
        inverter_id: inverter.id,
        energy_production: good_energy_production,
        datetime: datetime
      )
      hourly_production.save()
      expect(hourly_production).not_to be_valid
    end
  end
end
