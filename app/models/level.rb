class Level < ActiveRecord::Base
  has_many :parking_spaces, inverse_of: :level
end