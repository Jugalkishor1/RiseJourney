class CreateGpsLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :gps_logs do |t|
      t.references :bus, null: false, foreign_key: true
      t.decimal :latitude
      t.decimal :longitude
      t.decimal :speed
      t.datetime :recorded_at

      t.timestamps
    end
  end
end
