# app/models/user.rb
class User < ApplicationRecord
  has_secure_password

  belongs_to :district, optional: true
  belongs_to :school, optional: true
  
  enum role: { super_admin: 0, district_admin: 1, school_admin: 2, driver: 3, parent: 4, student: 5 }
  enum status: { inactive: 0, active: 1 }

  validates :email, presence: true, uniqueness: true
end
