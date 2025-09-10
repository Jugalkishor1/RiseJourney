class CreateCameraDevices < ActiveRecord::Migration[7.1]
  def change
    create_table :camera_devices do |t|
      t.string :mac_address
      t.string :provider
      t.string :stream_url
      t.references :bus, null: false, foreign_key: true

      t.timestamps
    end
    add_index :camera_devices, :mac_address, unique: true
  end
end
