require "rails_helper"

describe VehiclesController, type: :controller do
  describe "#create" do
    subject {post :create, vehicle: vehicle_params }

    let!(:level) { Level.create! mark: '1' }

    before { request.env["HTTP_REFERER"] = '/' }

    context "when available parking space present" do

      context "when vehicle is moto" do
        let(:available_parking_space){ ParkingSpaces::Moto.create level: level }
        let(:vehicle_params) { { licence_plate: "1234", type: :moto } }
        before do
          allow(ParkingSpaces::Moto).to receive(:vacant).and_return [ available_parking_space ]
        end

        it "should create new moto instance" do
          expect {subject}.to change(Moto, :count).by 1
        end

        it "should have not nil vehicle field" do
          subject
          expect(ParkingSpaces::Moto.last.vehicle).not_to be_nil
        end
      end

      context "when vehicle is car" do
        let(:available_parking_space){ ParkingSpaces::Car.create level: level }
        let(:vehicle_params) { { licence_plate: "1234", type: :car } }
        before do
          allow(ParkingSpaces::Car).to receive(:vacant).and_return [ available_parking_space ]
        end

        it "should create new car instance" do
          expect {subject}.to change(Car, :count).by 1
        end

        it "should have not nil vehicle field" do
          subject
          expect(ParkingSpaces::Car.last.vehicle).not_to be_nil
        end
      end
    end

    context "when available parking space is not present" do
      let(:vehicle_params) { { licence_plate: "1234", type: :moto } }
      before do
        allow(ParkingSpaces::Moto).to receive(:vacant).and_return []
      end

      it "should not create new moto instance" do
        expect{subject}.to change(Car, :count).by 0
      end
    end

  end
end