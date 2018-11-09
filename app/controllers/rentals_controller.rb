require "pry"
class RentalsController < ApplicationController

  def create
    #validate movie & customer first
    movie = Movie.find_by(id: params[:movie_id])
    customer = Customer.find_by(id: params[:customer_id])

    if customer && movie && movie.can_checkout?
      #can you rent the same movie twice
      rental = Rental.new(movie: movie, customer: customer)
      rental.checkout = DateTime.now
      rental.due_date = DateTime.now + 6

      if rental.save
        rental.movie.decrement_inventory
        rental.customer.increment_checked_out_count
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
    rental = Rental.get_rental(params[:movie_id], params[:customer_id])
    #add where the parameters are movie_id and customer_id and then order by due date
    #order and then return the .first value
    if rental
      rental.returned = DateTime.now

      if rental.save
        rental.movie.increment_inventory
        rental.customer.decrement_checked_out_count
        render json: { id: rental.id, returned: rental.returned }, status: :ok
      else
        render json: {
          message: rental.errors.messages
        }, status: :bad_request
      end
    else
      render json: {
        message: "Invalid customer or movie or rental returned"
      }, status: :bad_request
    end

  end

  private

  def rental_params
      params.permit(:movie_id, :customer_id)
  end
end
