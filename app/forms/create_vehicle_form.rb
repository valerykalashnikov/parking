class CreateVehicleForm
  include ActiveModel::Validations

  attr_accessor :vehicle

  def initialize parking_space, licence_plate
    @parking_space = parking_space
    @licence_plate = licence_plate
  end

  def save
    errors.add(:parking_space, "does not exist") and return false if @parking_space.nil?
    @vehicle = @parking_space.build_vehicle licence_plate: @licence_plate
    if @vehicle.invalid?
      errors.messages.merge! @vehicle.errors.messages
      return false
    end
    @parking_space.save!
    true
  end

  def valid?
    errors.blank?
  end
end