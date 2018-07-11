class MealRepository < BaseRepository
  def model_from_row(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    Meal.new(row)
  end

  def model_header
    %w( id, name, price )
  end

  def csv_row(meal)
    [ meal.id, meal.name, meal.price ]
  end
end
