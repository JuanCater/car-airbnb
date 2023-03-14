class ReservationsController < ApplicationController\
  #before_action :set_car, only: %i[new create]
  # before_action :set_movie, only: %i[new create]
  def index
    @restaurants = policy_scope(reservation)
  end

  def new
    # We need @restaurant in our `simple_form_for`

    @car = Car.find(params[:car_id])
    @reservation = Reservation.new
    authorize @reservation
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
    authorize @reservation
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to car_path(@reservation.car), status: :see_other
  end

  private

  def set_car
    @car = Car.find(params[:car_id])
  end

  def reservation_params
    params.require(:reservation).permit(:rented_from, :rented_until)
  end
end