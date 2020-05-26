require 'rails_helper'

RSpec.describe Inverter, type: :model do
  context 'Testing save and validation of an Inverter' do
    it "should save" do
      inverter = Inverter.new()
      inverter.save

      expect(inverter).to be_persisted
    end
  end
end
