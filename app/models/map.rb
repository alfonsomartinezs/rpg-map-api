class Map < ApplicationRecord
  has_many :locations, dependent: :destroy
end
