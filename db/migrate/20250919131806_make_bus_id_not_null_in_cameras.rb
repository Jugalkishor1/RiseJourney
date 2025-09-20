class MakeBusIdNotNullInCameras < ActiveRecord::Migration[7.1]
  def change
    change_column_null :cameras, :bus_id, false

  end
end
