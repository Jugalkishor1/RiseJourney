class School < ApplicationRecord
  belongs_to :district
  has_many :buses, dependent: :destroy
  has_many :students, dependent: :destroy
  has_many :users, dependent: :destroy

  def self.ransackable_associations(auth_object = nil)
    ["users", "buses", "students", "district"]
  end

  def self.ransackable_attributes(auth_object = nil)
    [
      "address",
      "contact_number",
      "contact_person",
      "created_at",
      "district_id",
      "id",
      "id_value",
      "name",
      "registration_no",
      "updated_at"
    ]
  end
end
