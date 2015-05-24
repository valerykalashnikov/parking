module ParkingSpaces
  class Location < ActiveRecord::Base
    self.table_name = 'parking_spaces'
    belongs_to :level, inverse_of: :parking_spaces

    validates :level, presence: true

    scope :vacant, -> {where vehicle_id: nil }
  end
end