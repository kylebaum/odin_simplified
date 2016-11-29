class CreateTenants < ActiveRecord::Migration
  def change
    create_table :tenants do |t|
      t.string :email
      t.string :password

      t.timestamps

    end
  end
end
