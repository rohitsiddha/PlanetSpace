class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :space_vehicles, :dependent => :destroy

  #this is for vehicles which this user has shared  
  has_many :shared_vehicles, :dependent => :destroy

  #this is for vehicles which the user has been shared by other users  
  has_many :being_shared_vehicles, :class_name => "SharedVehicle", :foreign_key => "shared_user_id", :dependent => :destroy

  has_many :shared_vehicles_by_others, :through => :being_shared_vehicles, :source => :space_vehicle

  def has_share_access?(space_vehicle)
    #has share access if the vehicle is created by his own  
    return true if self.space_vehicles.include?(space_vehicle)

    #has share access if the vehicle is one of the shared_vehicles_by_others  
    return true if self.shared_vehicles_by_others.include?(space_vehicle)

    return false
  end
end
