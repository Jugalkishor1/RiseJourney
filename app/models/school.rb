class School < ApplicationRecord
  belongs_to :district
  has_many :buses, dependent: :destroy
  has_many :students, dependent: :destroy
  has_many :users
end
