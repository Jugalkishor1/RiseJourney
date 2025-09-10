class District < ApplicationRecord
  has_many :schools, dependent: :destroy
  has_many :users
end
