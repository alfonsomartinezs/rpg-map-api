# app/serializers/map_serializer.rb
class MapSerializer
  include JSONAPI::Serializer

  attributes :name,:description, :cover_image_url, :body_image_url
  has_many :locations

  attribute :cover_image_url do |object|
    Rails.application.routes.url_helpers.rails_blob_url(object.cover_image, only_path: true) if object.cover_image.attached?
  end

  attribute :body_image_url do |object|
    Rails.application.routes.url_helpers.rails_blob_url(object.body_image, only_path: true) if object.body_image.attached?
  end


end