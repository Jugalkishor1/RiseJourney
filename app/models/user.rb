class User < ApplicationRecord
  belongs_to :district
  belongs_to :school
end
