class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :sender_type
      t.string :recipient_type
      t.text :body
      t.integer :property_id

      t.timestamps

    end
  end
end
