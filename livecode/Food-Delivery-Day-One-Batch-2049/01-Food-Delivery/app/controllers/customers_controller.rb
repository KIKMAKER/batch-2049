require_relative '../views/customers_view'
require_relative '../models/customer'
class CustomersController

  def initialize(customer_repository)
    @customers_view = CustomersView.new
    @customer_repository = customer_repository
  end

  def add
    # ask for the customer name
    customer_name = @customers_view.ask_for_name
    # ask for the customer address
    customer_address = @customers_view.ask_for_address
    # create an instance of customer
    customer = Customer.new(name: customer_name, address: customer_address)
    # save it in the db
    @customer_repository.create(customer)
  end

  def list
    # get the customers array (REPO)
    customers = @customer_repository.all
    # display the list (VIEW)
    @customers_view.display_list(customers)
  end
end
