require "test_helper"

describe Customer do
  #let(:customer) { Customer.new }

  # it "must be valid" do
  #   value(customer).must_be :valid?
  # end
  #
  # it "must have required fields" do
  #   fields = [:name, :registered, :postal_code, :phone]
  #
  #   fields.each do |field|
  #     expect(customers).must_respond_to field
  #   end
  # end

  describe 'Relationships' do

    it 'customer can have many movies' do
      #customer = customers(:customer1)
      movies = customers(:customer1).movies
      binding.pry
      expect(movies.count).must_be :>=, 1

      movies.each do |movie|
        expect(movie).must_be_instance_of Movie
      end
    end

  end
end

  #   it 'can have many orders' do
  #     user.orders << Order.first
  #     orders = user.orders
  #
  #     expect(orders.length).must_be :>=, 1
  #     orders.each do |order|
  #       expect(order).must_be_instance_of Order
  #     end
  #   end
  # end
  # describe 'Validations' do
  #   it 'must have name' do
  #       user = users(:dani)
  #       user.name = nil
  #
  #       valid = user.save
  #       expect(valid).must_equal false
  #       expect(user.errors.messages).must_include :name
  #
  #   end
    #
    # it 'must have valid email' do
    #   invalid_emails = [nil , "@", "dan"]
    #
    #   user = users(:dani)
    #
    #   invalid_emails.each do |invalid_email|
    #     user.email = invalid_email
    #
    #     valid = user.save
    #     expect(valid).must_equal false
    #     expect(user.errors.messages).must_include :email
    #   end
