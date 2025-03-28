class Map < ApplicationRecord
  has_many :locations, dependent: :destroy

  has_one_attached :cover_image
  has_one_attached :body_image
end
