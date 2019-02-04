class Api::V1::AddressesController < ApplicationController
  # skip_before_action :authorized
  skip_before_action :authorized, only: [:create]

  def index
    @addresses = Address.all 
    render json: @addresses, status: :ok
  end

  def show 
    @address = Address.find(params[:id])
    render json: @address, status: :ok
  end
  
  def create
    @address = Address.create(plant_params)
    render json: @address, status: :ok  
  end

  def update
    @address = Address.find(params[:id])
    @address.update(plant_params)
    render json: @address, status: :ok 
  end

  private
  def plant_params
    params.require(:address).permit(
      :street,
      :city, 
      :state, 
      :zip, 
      :plant_id, 
      :addressable_id, 
      :addressable_type 
    )
  end
end
