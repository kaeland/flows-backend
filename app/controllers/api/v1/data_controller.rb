class Api::V1::DataController < ApplicationController
  # skip_before_action :authorized
  skip_before_action :authorized, only: [:create]

  def index
    @data = Datum.all 
    render json: @data, status: :ok
  end

  def show 
    @datum = Datum.find(params[:id])
    render json: @datum, status: :ok
  end
  
  def create
    @datum = Datum.create(datum_params)
    render json: @datum, status: :ok  
  end

  def update
    @datum = Datum.find(params[:id])
    @datum.update(datum_params)
    render json: @datum, status: :ok 
  end

  private
  def datum_params
    params.require(:datum).permit(
      :name, 
      :payload,
      :machine_id
    )
  end
end
