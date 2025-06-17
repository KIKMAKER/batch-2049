class MealsView

  def ask_for_name
    puts "What is the meal called?"
    gets.chomp
  end

  def ask_for_price
    puts "How much is it?"
    gets.chomp.to_i
  end

  def display_list(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1}. #{meal.name} for R#{meal.price}"
    end
  end

end
