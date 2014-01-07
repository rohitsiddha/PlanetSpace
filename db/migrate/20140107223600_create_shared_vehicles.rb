class CreateSharedVehicles < ActiveRecord::Migration
  def change
    create_table :shared_vehicles do |t|
      t.integer :user_id
      t.string :shared_email
      t.integer :shared_user_id
      t.integer :space_vehicle_id

      t.timestamps
    end

    add_index :shared_vehicles, :user_id  
    add_index :shared_vehicles, :shared_user_id  
    add_index :shared_vehicles, :shared_vehicle_id  
  end
end
