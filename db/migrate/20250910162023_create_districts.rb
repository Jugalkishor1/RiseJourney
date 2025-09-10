class CreateDistricts < ActiveRecord::Migration[7.1]
  def change
    create_table :districts do |t|
      t.string :name
      t.string :address
      t.string :state
      t.string :pincode
      t.string :contact_person
      t.string :contact_number

      t.timestamps
    end
  end
end
