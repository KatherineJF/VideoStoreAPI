class RentalsController < ApplicationController

  def create
    rental = Rental.new(rental_params)

      # rental.save checks to see that rental is attached to a customer and movie and is valid
      # retnal.movie.can_checkout? returns true if there is enough inventory
      if rental.save && rental.movie.can_checkout?
        #decrements the new movie inventory attached to the new rental
        rental.movie.decrement_inventory
        render json: { id: rental.id }, status: :ok
      else
        render json: {
          message: movie.errors.messages
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
