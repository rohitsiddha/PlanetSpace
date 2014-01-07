class CreateSpaceVehicles < ActiveRecord::Migration
  def change
    create_table :space_vehicles do |t|
      t.string :name
      t.integer :engine_power
      t.string :fuel_type
      t.date :start_date
      t.date :delivery_date
      t.string :vehicle_type
      t.integer :can_carry
      t.integer :user_id

      t.timestamps
    end

    case ActiveRecord::Base.connection.adapter_name.downcase.to_sym
    when :sqlite
      execute "INSERT INTO SQLITE_SEQUENCE (seq, name) VALUES(1000, 'space_vehicles') "
    when :postgres
      execute "SELECT setval('space_vehicles_id_seq', 1000)"
    when :mysql, :mysql2
      execute "ALTER TABLE space_vehicles AUTO_INCREMENT = 1000"
    else
      raise NotImplementedError, "Unknown adapter type '#{ActiveRecord::Base.connection.adapter_name}'" 
    end
    
  end
end
