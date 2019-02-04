class Api::V1::ShiftsController < ApplicationController
  # skip_before_action :authorized
  skip_before_action :authorized, only: [:create]

  def index
    @shifts = Shift.all 
    render json: @shifts, status: :ok
  end

  def show 
    @shift = Shift.find(params[:id])
    render json: @shift, status: :ok
  end
  
  def create
    @shift = Shift.create(shift_params)
    render json: @shift, status: :ok  
  end

  def update
    @shift = Shift.find(params[:id])
    @shift.update(shift_params)
    render json: @shift, status: :ok 
  end

  private
  def shift_params
    params.require(:shift).permit(
      :name,
      :user_id, 
      :round_id
    )
  end
end
