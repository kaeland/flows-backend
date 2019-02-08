class Api::V1::MachineRoundsController < ApplicationController
   # skip_before_action :authorized
   skip_before_action :authorized, only: [:create]

  def index
    @machine_rounds = MachineRound.all 
    render json: @machine_rounds.to_json(:include => :machine), status: :ok
  end

  def create
    byebug
  end

  def submit_rounds
    byebug
  end

  def update
    byebug 
  end

  private
  def machine_round_params
    params.permit(machine_round: [])
  end
end