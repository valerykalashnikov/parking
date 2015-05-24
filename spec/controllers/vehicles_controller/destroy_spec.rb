require "rails_helper"

describe VehiclesController, type: :controller do
  describe "#destroy" do
    subject {delete :destroy, id: moto.id }

    let!(:level) { Level.create! mark: '1' }

    let(:parking_space){ ParkingSpaces::Moto.create level: level }

    let!(:moto) do
      parking_space.build_vehicle licence_plate: "1234"
      parking_space.save
      parking_space
    end

    it "should destroy vehicle instance" do
      expect {subject}.to change(Moto, :count).by -1
    end

    it "should make parking space empty" do
      subject
      expect(parking_space.reload.vehicle_id).to be_nil
    end

  end
end