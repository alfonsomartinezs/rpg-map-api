class Location < ApplicationRecord
  belongs_to :map
  has_many :aspect_assignments, dependent: :destroy
  has_many :aspects, through: :aspect_assignments
end
