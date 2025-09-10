class CreateStudents < ActiveRecord::Migration[7.1]
  def change
    create_table :students do |t|
      t.references :school, null: false, foreign_key: true
      t.string :name
      t.string :class_name
      t.string :section
      t.string :roll_no

      t.timestamps
    end
  end
end
