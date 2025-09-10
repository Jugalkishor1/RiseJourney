class Bus < ApplicationRecord
  belongs_to :school
  belongs_to :driver
end
