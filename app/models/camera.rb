class Camera < ApplicationRecord
  belongs_to :bus 

  def self.ransackable_associations(auth_object = nil)
    ["bus"]
  end
  def self.ransackable_attributes(auth_object = nil)
    [
      "id",
      "name",
      "location",
      "bus",
      "stream_url",
      "created_at",
      "updated_at"
    ]
  end
end

