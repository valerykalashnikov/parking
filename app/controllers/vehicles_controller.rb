class VehiclesController < ApplicationController
  before_action :find_available_parking_space, only: :create

  def show
    @vehicle = Vehicle.find_by! licence_plate: params[:id]
  end

  def create
    create_vehicle_form = CreateVehicleForm.new(@parking_space, vehicle_params[:licence_plate])
    create_vehicle_form.save
    unless create_vehicle_form.valid?
      redirect_to :back, flash: { errors: create_vehicle_form.errors.full_messages.first } and return
    end
    redirect_to vehicle_path(create_vehicle_form.vehicle.licence_plate)
  end

  def destroy
    @vehicle = Vehicle.find params[:id]
    @vehicle.space.update vehicle_id: nil
    @vehicle.destroy
    redirect_to root_path
  end

  private

  def find_available_parking_space
    klass = "ParkingSpaces::#{vehicle_params[:type].capitalize}".constantize
    @parking_space = klass.vacant.sample
  end

  def vehicle_params
    params.require(:vehicle).permit(:type, :licence_plate)
  end

end