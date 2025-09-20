class AddBusToCameras < ActiveRecord::Migration[7.1]
  def change
    add_reference :cameras, :bus, foreign_key: true, null: true

  end
end
