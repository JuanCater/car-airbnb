class ReservationsController < ApplicationController
  #before_action :set_car, only: %i[new create]
  # before_action :set_movie, only: %i[new create]
  def index
    @reservations = policy_scope(Reservation)
  end

  def show
    @reservation = Reservation.find(params[:reservation_id])
    @car = Car.find(params[:car_id])
    authorize @reservation
  end

  def new
    # We need @restaurant in our `simple_form_for`
    @car = Car.find(params[:car_id])
    @reservation = Reservation.new
    authorize @reservation
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @car = @reservation.car
    @user = current_user
    authorize @reservation
  end

  def update
    @reservation = Reservation.find(params[:id])
    @car = @reservation.car
    authorize @reservation
    @reservation.update(reservation_params) # Will raise ActiveModel::ForbiddenAttributesError
    if @reservation.car.user == current_user
      redirect_to car_path(@car)
    else
      redirect_to reservations_path
    end
  end

  def create
    # @review = Review.new(review_params)
    # @review.restaurant = @restaurant
    # @review.save
    # redirect_to restaurant_path(@restaurant)
    @car = Car.find(params[:car_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.car = @car
    @reservation.status = "pending"
    @reservation.user = current_user
    authorize @reservation
    if @reservation.save
      redirect_to car_path(@car)
    else
      render "cars/show", status: :unprocessable_entity
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    authorize @reservation
    @reservation.destroy
    redirect_to reservations_path, status: :see_other
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def reservation_params
    params.require(:reservation).permit(:rented_from, :rented_until, :status)
  end
end
