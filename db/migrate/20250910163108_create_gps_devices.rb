class CreateGpsDevices < ActiveRecord::Migration[7.1]
  def change
    create_table :gps_devices do |t|
      t.string :imei_no
      t.string :provider
      t.string :status
      t.references :bus, null: false, foreign_key: true

      t.timestamps
    end
    add_index :gps_devices, :imei_no, unique: true
  end
end
