class SpaceVehiclesController < ApplicationController
  before_filter :authenticate_user!
  # GET /space_vehicles
  # GET /space_vehicles.json
  def index
    #@space_vehicles = SpaceVehicle.all
    @space_vehicles = current_user.space_vehicles

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @space_vehicles }
    end
  end

  # GET /space_vehicles/1
  # GET /space_vehicles/1.json
  def show
    #@space_vehicle = SpaceVehicle.find(params[:id])
    begin
      @space_vehicle = current_user.space_vehicles.find(params[:id])
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @space_vehicle }
      end
      
    rescue Exception => e
      flash[:error] = "Don't be smart! Mind your own vehicles!"
      redirect_to space_vehicles_path  
    end

  end

  # GET /space_vehicles/new
  # GET /space_vehicles/new.json
  def new
    #@space_vehicle = SpaceVehicle.new
    @space_vehicle = current_user.space_vehicles.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @space_vehicle }
    end
  end

  # GET /space_vehicles/1/edit
  def edit
    #@space_vehicle = SpaceVehicle.find(params[:id])
    @space_vehicle = current_user.space_vehicles.find(params[:id])
  end

  # POST /space_vehicles
  # POST /space_vehicles.json
  def create
    #@space_vehicle = SpaceVehicle.new(params[:space_vehicle])
    @space_vehicle = current_user.space_vehicles.new(params[:space_vehicle])

    respond_to do |format|
      if @space_vehicle.save
        format.html { redirect_to @space_vehicle, notice: 'Space vehicle was successfully created.' }
        format.json { render json: @space_vehicle, status: :created, location: @space_vehicle }
      else
        format.html { render action: "new" }
        format.json { render json: @space_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /space_vehicles/1
  # PUT /space_vehicles/1.json
  def update
    #@space_vehicle = SpaceVehicle.find(params[:id])
    @space_vehicle = current_user.space_vehicles.find(params[:id])

    respond_to do |format|
      if @space_vehicle.update_attributes(params[:space_vehicle])
        format.html { redirect_to @space_vehicle, notice: 'Space vehicle was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @space_vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /space_vehicles/1
  # DELETE /space_vehicles/1.json
  def destroy
    #@space_vehicle = SpaceVehicle.find(params[:id])
    @space_vehicle = current_user.space_vehicles.find(params[:id])
    @space_vehicle.destroy

    respond_to do |format|
      format.html { redirect_to space_vehicles_url }
      format.json { head :no_content }
    end
  end
end