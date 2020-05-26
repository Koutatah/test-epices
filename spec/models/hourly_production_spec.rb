require 'rails_helper'

RSpec.describe HourlyProduction, type: :model do
  describe "" do
    it "should not save because energy_production are less than zero" do
      hourly_production = HourlyProduction.new(energy_production: -1)
      byebug
      hourly_production.daily_production = DailyProduction.create! energy_production: 0
      expect(assigns(:hourly_production)).to be false
    end
  end
end
