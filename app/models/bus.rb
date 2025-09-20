class Bus < ApplicationRecord
  belongs_to :school
  belongs_to :driver, class_name: "User", optional: true
  has_many :cameras 

  enum status: { inactive: 0, active: 1, under_maintenance: 2 }

  # validates :registration_no, presence: true, uniqueness: true

   def self.ransackable_associations(auth_object = nil)
    ["cameras", "driver", "school"]
  end

    def self.ransackable_attributes(auth_object = nil)
    ["capacity", "created_at", "gps_device_id", "id", "id_value", "registration_no", "school_id", "status", "updated_at"]
  end
end
