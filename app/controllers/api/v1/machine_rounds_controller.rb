require 'pry'

class Api::V1::MachineRoundsController < ApplicationController
   # skip_before_action :authorized
   skip_before_action :authorized, only: [:create]

  def index
    @machine_rounds = MachineRound.all 
    render json: @machine_rounds.to_json(:include => :machine), status: :ok
  end

  def create

  end

  def update
    @machine_round = MachineRound.find(params[:id])
    # binding.pry 
    @machine_round.update(machine_round_params)
    render json: @machine_round, status: :ok 
  end

  private
  def machine_round_params
    params.require(:machine_round).permit(:data, :id)
  end
end



# Previous code:
# def create
  #   binding.pry
  #   machine_round_params.each do |m|
  #     machine_round = MachineRound.new(m)
  #     machine_round.save
  #   end
  # end

  # def update_machine_rounds
  #   @new_machine_rounds = machine_round_params.map do |m|
  #     machine_round = MachineRound.find(m["id"])
  #     machine_round.update(m)
      
  #     binding.pry 
  #   end
  #   render json: @new_machine_rounds, status: :ok 
  # end


   # params.permit(machine_round: [:data, :machine_id, :round_id])
    # params.permit(machine_round: [])
    # params.permit(:machine_round, [:data, :machine_id, :round_id])
    # params.require(:machine_round).map do |m|
    #   ActionController::Parameters.new(m.to_hash).permit(:title, :src)
    # end

    # Below is the code Brit created for me: 
    # params.require(:machine_round).map {|p| p.permit(:id, :machine_id, :round_id, :data).to_h }