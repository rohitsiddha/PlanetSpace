class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :space_vehicles

  #this is for vehicles which this user has shared  
  has_many :shared_vehicles, :dependent => :destroy

  #this is for vehicles which the user has been shared by other users  
  has_many :being_shared_vehicles, :class_name => "SharedVehicle", :foreign_key => "shared_user_id", :dependent => :destroy

end
