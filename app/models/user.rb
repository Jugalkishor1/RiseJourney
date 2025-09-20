# app/models/user.rb
class User < ApplicationRecord
  has_secure_password

  belongs_to :district, optional: true
  belongs_to :school, optional: true
  
  enum role: { super_admin: 0, district_admin: 1, school_admin: 2, driver: 3, parent: 4, student: 5 },  _prefix: true
  enum status: { inactive: 0, active: 1 }

  validates :email, presence: true, uniqueness: true

  def self.ransackable_associations(auth_object = nil)
    ["school"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "district_id", "email", "id", "id_value", "name", "password_digest", "phone_number", "role", "school_id", "status", "updated_at"]
  end
end
