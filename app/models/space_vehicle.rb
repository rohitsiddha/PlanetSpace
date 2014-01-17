class SpaceVehicle < ActiveRecord::Base

  FUEL_TYPES = %w[chemical antimatter gasoline]
  VEHICLE_TYPES = %w[shuttle satellite]

  attr_accessible :can_carry, :delivery_date, :engine_power, :fuel_type, :name, :start_date, :user_id, :vehicle_type

  belongs_to :user
  has_many :shared_vehicles, :dependent => :destroy  
  has_many :shared_users,  :through => :shared_vehicles, :foreign_key => "space_vehicle_id", :source => :shared_user

  validates :can_carry, :delivery_date, :engine_power, :fuel_type, :name, :start_date, :user_id, :vehicle_type, :presence => true
  validates :engine_power, :numericality => { :greater_than => 0, :less_than_or_equal_to => 90}

  def accessible_to
    result = self.shared_users.map {|user| {user_id: user.id, email: user.email}}
    result << {user_id: self.user.id, email: self.user.email}
  end
end
