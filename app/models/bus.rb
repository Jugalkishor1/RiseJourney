class Bus < ApplicationRecord
  belongs_to :school
  belongs_to :driver, class_name: "User", optional: true

  enum status: { inactive: 0, active: 1, under_maintenance: 2 }

  validates :registration_no, presence: true, uniqueness: true
end
