class MealsView
  def display_meals(meals)
    meals.each do |meal|
      puts "#{meal.name}: #{meal.price}"
    end
  end

  def ask_user_for(attribute)
    puts "Please enter meal #{attribute}"
    gets.chomp
  end
end