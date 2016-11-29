class CreateMaintenanceRequests < ActiveRecord::Migration
  def change
    create_table :maintenance_requests do |t|
      t.integer :property_id
      t.text :body_of_request

      t.timestamps

    end
  end
end
