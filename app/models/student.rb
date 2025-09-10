class Student < ApplicationRecord
  belongs_to :school
  belongs_to :parent
end
