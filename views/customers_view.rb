class CustomersView
  def display_customers(customers)
    customers.each do |customer|
      puts "#{customer.name}: #{customer.address}"
    end
  end

  def ask_user_for(attribute)
    puts "Please enter customer #{attribute}"
    gets.chomp
  end
end