# app/controllers/api/maps_controller.rb
class Api::MapsController < ApplicationController
  def index
    maps = Map.all
    render json: MapSerializer.new(maps).serializable_hash.to_json
  end

  def show
    map = Map.find(params[:id])
    render json: MapSerializer.new(map, include: [:locations]).serializable_hash.to_json
  end

  def create
    map = Map.new(map_params)
    map.cover_image.attach(params[:cover_image]) if params[:cover_image]
    map.body_image.attach(params[:body_image]) if params[:body_image]

    if map.save
      render json: MapSerializer.new(map).serializable_hash.to_json, status: :created
    else
      render json: { errors: map.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    map = Map.find(params[:id])

    map.cover_image.attach(params[:cover_image]) if params[:cover_image]
    map.body_image.attach(params[:body_image]) if params[:body_image]
  
    if map.update(map_params)
      render json: MapSerializer.new(map).serializable_hash.to_json
    else
      render json: { errors: map.errors.full_messages }, status: :unprocessable_entity
    end
  end


  private

  def map_params
    params.permit(:name,:description)
  end
end
