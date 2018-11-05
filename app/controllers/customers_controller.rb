class CustomersController < ApplicationController
  def index
    customers = Customer.all
    render json: customers, status: :ok
  end

  def create
  end

  def show
  end
end
