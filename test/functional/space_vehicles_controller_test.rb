require 'test_helper'

class SpaceVehiclesControllerTest < ActionController::TestCase
  setup do
    @space_vehicle = space_vehicles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:space_vehicles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create space_vehicle" do
    assert_difference('SpaceVehicle.count') do
      post :create, space_vehicle: { can_carry: @space_vehicle.can_carry, delivery_date: @space_vehicle.delivery_date, engine_power: @space_vehicle.engine_power, fuel_type: @space_vehicle.fuel_type, name: @space_vehicle.name, start_date: @space_vehicle.start_date, user_id: @space_vehicle.user_id, vehicle_type: @space_vehicle.vehicle_type }
    end

    assert_redirected_to space_vehicle_path(assigns(:space_vehicle))
  end

  test "should show space_vehicle" do
    get :show, id: @space_vehicle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @space_vehicle
    assert_response :success
  end

  test "should update space_vehicle" do
    put :update, id: @space_vehicle, space_vehicle: { can_carry: @space_vehicle.can_carry, delivery_date: @space_vehicle.delivery_date, engine_power: @space_vehicle.engine_power, fuel_type: @space_vehicle.fuel_type, name: @space_vehicle.name, start_date: @space_vehicle.start_date, user_id: @space_vehicle.user_id, vehicle_type: @space_vehicle.vehicle_type }
    assert_redirected_to space_vehicle_path(assigns(:space_vehicle))
  end

  test "should destroy space_vehicle" do
    assert_difference('SpaceVehicle.count', -1) do
      delete :destroy, id: @space_vehicle
    end

    assert_redirected_to space_vehicles_path
  end
end
