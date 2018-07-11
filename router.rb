class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    while @running
      @employee = @sessions_controller.sign_in unless @employee
      if @employee.role == 'manager'
        display_manager_tasks
        user_action = get_user_action
        route_manager_action(user_action)
      else
        display_delivery_guy_tasks
        user_action = get_user_action
        route_delivery_guy_action(user_action)
      end
    end
  end

  def get_user_action
    puts "What do you want to do?"
    gets.chomp.to_i
  end

  def stop
    @running = false
  end

  def sign_out
    @employee = nil
  end

  def route_manager_action(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 9 then sign_out
    when 0 then stop
    else
      puts "Invalid option. Please try again"
    end
  end

  def display_manager_tasks
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - List all customers"
    puts "4 - Add a customer"
    puts "9 - Logout"
    puts "0 - Quit"
  end

  def route_delivery_guy_action(action)
    case action
    when 1 then puts "TODO: Controller action: List all orders"
    when 2 then puts "TODO: Controller action: Mark order as deivered"
    when 9 then sign_out
    when 0 then stop
    else
      puts "Invalid option. Please try again"
    end
  end

  def display_delivery_guy_tasks
    puts "1 - List all orders"
    puts "2 - Mark order as delivered"
    puts "9 - Logout"
    puts "0 - Quit"
  end
end