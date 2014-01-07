class SpaceVehicle < ActiveRecord::Base

  FUEL_TYPES = %w[chemical antimatter gasoline]
  VEHICLE_TYPES = %w[shuttle satellite]

  attr_accessible :can_carry, :delivery_date, :engine_power, :fuel_type, :name, :start_date, :user_id, :vehicle_type
  belongs_to :user
  has_many :shared_vehicles, :dependent => :destroy  
end
