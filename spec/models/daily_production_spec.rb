require 'rails_helper'

RSpec.describe DailyProduction, type: :model do
  let(:good_energy_production) { 100 }
  let(:inverter) { Inverter.create! }
  let(:bad_energy_production) { -1 }
  let(:date) { DateTime.current.to_date }
  let(:hourly_production) {
    HourlyProduction.create!(
      inverter_id: inverter.id,
      energy_production: good_energy_production,
      daily_production_id: daily_production.id,
      datetime: datetime
    )
  }

  context 'Testing save and validation of a DailyProduction' do
    it "should save" do
      daily_production = DailyProduction.new(
        energy_production: good_energy_production,
        date: date
      )
      daily_production.save

      expect(daily_production).to be_persisted
    end

    it "should not save because energy_production not provide" do
      daily_production = DailyProduction.new(
        date: date
      )
      daily_production.save()
      expect(daily_production).not_to be_valid
    end

    it "should not save because energy_production are less than zero" do
      daily_production = DailyProduction.new(
        energy_production: bad_energy_production,
        date: date
      )
      daily_production.save()
      expect(daily_production).not_to be_valid
    end

    it "should not save because datetime not provide" do
      daily_production = DailyProduction.new(
        energy_production: good_energy_production,
      )
      daily_production.save()
      expect(daily_production).not_to be_valid
    end
  end
end
