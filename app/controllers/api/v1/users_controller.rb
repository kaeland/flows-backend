class Api::V1::UsersController < ApplicationController
  # skip_before_action :authorized
  skip_before_action :authorized, only: [:create]

  def index
    @users = User.all 
    render json: @users, status: :ok
  end

  def show 
    @user = User.find(params[:id])
    render json: @user, status: :ok
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    render json: @user, status: :ok 
  end

  def destroy
    @user = User.find(params[:id])
    first_name = @user.first_name
    last_name = @user.last_name
    @user.destroy 
    render json: { status: "#{first_name} #{last_name} deleted." }, status: :ok
  end

  def profile
    render json: current_user.to_json(:except => :plant_id, :include => :plant), status: :accepted 
  end
 
  def create
    @user = User.new(user_params)
    if @user.valid? 
      @user.save 
      @token = encode_token({ user_id: @user.id })
      render json: { user: @user, jwt: @token, message: 'success' }, status: :created
    else
      message = User.create(user_params).errors.full_messages.to_sentence
      render json: { message: message }, status: :not_acceptable
    end
  end

  private
  def user_params
    params.require(:user).permit(
      :username, 
      :password, 
      :bio, 
      :avatar, 
      :plant_id, 
      :manager_id, 
      :first_name, 
      :last_name, 
      :plant_id
    )
  end
end
