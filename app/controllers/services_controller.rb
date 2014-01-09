class ServicesController < ApplicationController
  def space_vehicle_details
    space_vehicle = SpaceVehicle.find_by_id(params[:id])
    
    @response = { 
                  :id             =>  space_vehicle.id,
                  :engine_info    =>  {
                                        :power_rating => space_vehicle.engine_power,
                                        :fuel_type => space_vehicle.fuel_type
                                      },
                  :delivery_date  => space_vehicle.delivery_date
                }
    
    send_response  
  end

  def space_vehicle_shared_with
    space_vehicle = SpaceVehicle.find_by_id(params[:id])
    
    @response = { 
                  :id             =>  space_vehicle.id,
                  :engine_info    =>  {
                                        :power_rating => space_vehicle.engine_power,
                                        :fuel_type => space_vehicle.fuel_type
                                      },
                  :accessible_to  => space_vehicle.accessible_to
                }
    send_response
  end

  def send_response
    respond_to do |format|
      format.json { render json: @response }
    end
  end
end