class Api::V1::MachinesController < ApplicationController
  skip_before_action :authorized
  # skip_before_action :authorized, only: [:create]

  def index
    @machines = Machine.all 
    render json: @machines, status: :ok
  end

  def show 
    @machine = Machine.find(params[:id])
    render json: @machine, status: :ok
  end
  
  def create
    @machine = Machine.create(machine_params)
    render json: @machine, status: :ok  
  end

  def update
    @machine = Machine.find(params[:id])
    @machine.update(machine_params)
    render json: @machine, status: :ok 
  end

  private
  def machine_params
    params.require(:machine).permit(
      :name, 
      :plant_id,
      :round_id
    )
  end
end
