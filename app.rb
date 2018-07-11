require 'csv'

require_relative 'views/meals_view'
require_relative 'views/customers_view'
require_relative 'views/sessions_view'

require_relative 'models/meal'
require_relative 'models/customer'
require_relative 'models/employee'

require_relative 'repositories/base_repository'
require_relative 'repositories/meal_repository'
require_relative 'repositories/customer_repository'
require_relative 'repositories/employee_repository'

require_relative 'controllers/meals_controller'
require_relative 'controllers/customers_controller'
require_relative 'controllers/sessions_controller'

require_relative 'router'

# list all the meals
meals_csv = 'data/meals.csv'
meal_repository = MealRepository.new(meals_csv)
meals_controller = MealsController.new(meal_repository)

customers_csv = 'data/customers.csv'
customer_repository = CustomerRepository.new(customers_csv)
customers_controller = CustomersController.new(customer_repository)

employees_csv = 'data/employees.csv'
employee_repository = EmployeeRepository.new(employees_csv)
sessions_controller = SessionsController.new(employee_repository)

router = Router.new(
  meals_controller,
  customers_controller,
  sessions_controller
)

router.run
