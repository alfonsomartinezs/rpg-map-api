class Aspect < ApplicationRecord
  has_many :aspect_assignments, dependent: :destroy
  has_many :locations, through: :aspect_assignments
end
