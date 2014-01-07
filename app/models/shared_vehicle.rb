class SharedVehicle < ActiveRecord::Base
  attr_accessible :shared_email, :shared_user_id, :space_vehicle_id, :user_id

  #this is for the owner(creator) of the space_vehicle
  belongs_to :user

  #this is for the user to whom the owner has shared vehicle to
  belongs_to :shared_user, :class_name => "User", :foreign_key => "shared_user_id"

  #for the vehicle being shared  
  belongs_to :space_vehicle
end
