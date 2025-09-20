class CreateCameras < ActiveRecord::Migration[7.1]
  def change
    create_table :cameras do |t|
      t.string :name
      t.string :location
      t.string :stream_url

      t.timestamps
    end
  end
end
