class Api::V1::PlantsController < ApplicationController
  # skip_before_action :authorized
  skip_before_action :authorized, only: [:create]

  def index
    @plants = Plant.all 
    render json: @plants, status: :ok
  end

  def show 
    @plant = Plant.find(params[:id])
    render json: { plant: @plant, stats: @plant.plant_stats } , status: :ok
  end
  
  def create
    @plant = Plant.create(plant_params)
    render json: @plant, status: :ok  
  end

  def update
    @plant = Plant.find(params[:id])
    @plant.update(plant_params)
    render json: @plant, status: :ok 
  end

  # Extra routes below: 
  def get_plant_stats
    @plant_stats = Plant.plant_stats
    render json: @plant_stats, status: :ok 
  end

  private
  def plant_params
    params.require(:plant).permit(:name)
  end
end
