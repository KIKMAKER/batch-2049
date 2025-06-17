class CustomersView

  def ask_for_name
    puts "What is the customer's name?"
    gets.chomp
  end

  def ask_for_address
    puts "What's the address?"
    gets.chomp
  end

  def display_list(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name} in #{customer.address}"
    end
  end
end
