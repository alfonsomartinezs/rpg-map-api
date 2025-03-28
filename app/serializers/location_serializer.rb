# app/serializers/location_serializer.rb
class LocationSerializer
  include JSONAPI::Serializer

  attributes :name, :description, :x, :y

  belongs_to :map
  has_many :aspects
end