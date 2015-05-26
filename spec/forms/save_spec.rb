require "rails_helper"

describe CreateVehicleForm do
  describe "#save" do

    let(:licence_plate) { '1234' }

    let(:create_vehicle_form) { described_class.new(parking_space, licence_plate)}

    let!(:level) { Level.create! mark: '1' }

    let(:parking_space) { ParkingSpaces::Moto.create level: level }

    subject { create_vehicle_form.save }

    context "when parking space is nil" do
      let(:parking_space) { nil }

      it {is_expected.to be false }

      it "should have not nil parking space error" do
        subject
        expect(create_vehicle_form.errors[:parking_space].size).to eq 1
      end


    end

    context "when parking space present" do

      it {is_expected.to be true}

      it "should have not nil vehicle" do
        subject
        expect(create_vehicle_form.vehicle.persisted?).to be true
      end

    end

    context "when parking space present and vehicle exists in database" do
      before {parking_space.create_vehicle licence_plate: licence_plate }

      it {is_expected.to be false}

      it "should have not nil uniqueness error" do
        subject
        expect(create_vehicle_form.errors[:licence_plate].size).to eq 1
      end

    end
  end
end