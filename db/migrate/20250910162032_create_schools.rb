class CreateSchools < ActiveRecord::Migration[7.1]
  def change
    create_table :schools do |t|
      t.references :district, null: false, foreign_key: true
      t.string :name
      t.string :address
      t.string :registration_no
      t.string :contact_person
      t.string :contact_number

      t.timestamps
    end
  end
end
