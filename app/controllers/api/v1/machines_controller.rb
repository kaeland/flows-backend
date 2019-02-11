require 'pry'

class Api::V1::MachinesController < ApplicationController
  # skip_before_action :authorized
  skip_before_action :authorized, only: [:create]

  def index
    @machines = Machine.all 
    render json: @machines.to_json(:include => [:machine_rounds, :rounds]), status: :ok
  end

  def show 
    @machine = Machine.find(params[:id])
    render json: @machine, status: :ok
  end
  
  def create
    @machine = Machine.create(machine_params)
    Round.all.each do |r|
      r_id = r.id 
      machine_round = MachineRound.create(machine_id: @machine.id, round_id: r_id)
      @machine.machine_rounds << machine_round
    end
    render json: Machine.all.to_json(:include => [:machine_rounds, :rounds]), status: :ok  
  end

  def update
    @machine = Machine.find(params[:id])
    @machine.update(machine_params)
    render json: @machine, status: :ok 
  end

  def destroy
    @machine = Machine.find(params[:id])
    # binding.pry
    @machine.destroy
    render json: Machine.all.to_json(:include => [:machine_rounds, :rounds]), status: :ok
  end

  private
  def machine_params
    params.require(:machine).permit(
      :name, 
      :plant_id
    )
  end
end
