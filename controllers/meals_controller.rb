class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    meals = @meal_repository.all
    @meals_view.display_meals(meals)
  end

  def add
    name = @meals_view.ask_user_for("name")
    price = @meals_view.ask_user_for("price").to_i

    meal = Meal.new(name: name, price: price)
    @meal_repository.add(meal)
  end
end