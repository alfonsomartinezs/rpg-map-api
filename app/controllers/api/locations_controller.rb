class Api::LocationsController < ApplicationController
  def create_for_map
    map = Map.find_by(id: params[:map_id])
  
    if map.nil?
      render json: { error: "Map not found" }, status: :not_found
      return
    end
  
    location = map.locations.build(location_params)
  
    if location.save
      render json: LocationSerializer.new(location).serializable_hash.to_json, status: :created
    else
      render json: { errors: location.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    location = Location.find(params[:id])
    render json: LocationSerializer.new(location, {
      include: [:map, :aspects],
      params: { include_map: true }
    }).serializable_hash.to_json
  end


  private
  def location_params
    params.require(:location).permit(:name, :description, :x, :y)
  end
end