class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.integer :owner_id
      t.integer :tenant_id
      t.integer :manager_id
      t.string :home_or_apartment
      t.integer :number_bedrooms
      t.integer :number_bathrooms
      t.string :city
      t.string :neighborhood
      t.string :policies
      t.integer :price

      t.timestamps

    end
  end
end
