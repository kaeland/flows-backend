class Api::V1::RoundsController < ApplicationController
  skip_before_action :authorized
  # skip_before_action :authorized, only: [:create]

  def index
    @rounds = Round.all 
    render json: @rounds, status: :ok
  end

  def show 
    @round = Round.find(params[:id])
    render json: @round, status: :ok
  end
  
  def create
    @round = Round.create(round_params)
    render json: @round, status: :ok  
  end

  def update
    @round = Round.find(params[:id])
    @round.update(round_params)
    render json: @round, status: :ok 
  end

  private
  def round_params
    params.require(:round).permit(
      :time_of_day
    )
  end
end
