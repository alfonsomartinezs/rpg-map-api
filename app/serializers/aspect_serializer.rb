# app/serializers/location_serializer.rb
class AspectSerializer
  include JSONAPI::Serializer

  attributes :name, :description

  belongs_to :map
  has_many :aspects
end