class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :set_car, only: %i[show edit update destroy]

  def index
    @cars = policy_scope(Car)
  end

  def show
    authorize @car
  end

  def new
    @car = Car.new
    authorize @car
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    authorize @car
    if @car.save # Will raise ActiveModel::ForbiddenAttributesError
      redirect_to car_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @car
  end

  def update
    authorize @car
    @car.update(car_params) # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to car_path(@car)
  end

  def destroy
    authorize @car
    @car.destroy
    # No need for app/views/cars/destroy.html.erb
    redirect_to cars_path, status: :see_other
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:brand, :model, :year, :user_id, photos: [])
  end

end
