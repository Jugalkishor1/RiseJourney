class District < ApplicationRecord
  has_many :schools, dependent: :destroy
  has_many :users, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    [
      "address",
      "contact_number",
      "contact_person",
      "created_at",
      "id",
      "id_value",
      "name",
      "pincode",
      "state",
      "updated_at"
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    ["schools", "users"]
  end
end
