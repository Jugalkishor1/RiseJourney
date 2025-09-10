class CreateBuses < ActiveRecord::Migration[7.1]
  def change
    create_table :buses do |t|
      t.references :school, null: false, foreign_key: true
      t.string :registration_no
      t.integer :gps_device_id
      t.integer :status
      t.integer :capacity

      t.timestamps
    end
  end
end
