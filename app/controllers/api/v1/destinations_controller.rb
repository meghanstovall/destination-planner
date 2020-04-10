class Api::V1::DestinationsController < ApplicationController

  def index
    render json: DestinationSerializer.new(Destination.all)
  end

  def show
    render json: DestinationSerializer.new(Destination.find(params[:id]))
  end

  def create
    render json: DestinationSerializer.new(Destination.create(private_params))
  end

  def update
    render json: DestinationSerializer.new(Destination.update(params[:id], private_params))
  end

  def destroy
    render json: Destination.delete(params[:id])
  end

  private
    def private_params
      params.permit(:name, :zip, :description, :image_url)
    end
end
