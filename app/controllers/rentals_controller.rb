class RentalsController < ApplicationController

  def create
    #validate movie & customer first
    movie = Movie.find_by(id: params[:movie_id])
    customer = Customer.find_by(id: params[:customer_id])

    if customer && movie && movie.can_checkout?
      rental = Rental.new(movie: movie, customer: customer)
      rental.checkout = DateTime.now
      rental.due_date = DateTime.now + 6

      if rental.save
        rental.movie.decrement_inventory
        render json: { id: rental.id, checkout: rental.checkout, due_date: rental.due_date }, status: :ok
      else
        render json: {
          message: rental.errors.messages
        }, status: :bad_request
      end
    else
      render json: {
        message: "Invalid customer or movie or movie not available"
      }, status: :bad_request
    end
  end

  def update
  end

  private

  def rental_params
      params.permit(:movie_id, :customer_id)
  end
end
