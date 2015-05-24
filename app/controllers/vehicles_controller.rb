class VehiclesController < ApplicationController
  before_action :find_available_parking_space, only: :create

  def show
    @vehicle = Vehicle.find_by! licence_plate: params[:id]
  end

  def create
    redirect_to :back, flash: { errors: 'There are no vacant spaces' } and return unless @parking_space
    vehicle = @parking_space.build_vehicle licence_plate: vehicle_params[:licence_plate]
    redirect_to :back, flash: { errors: vehicle.errors.full_messages.first } and return unless vehicle.valid?
    @parking_space.save!
    redirect_to vehicle_path(vehicle.licence_plate)
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