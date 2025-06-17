require_relative '../views/meals_view'
require_relative '../models/meal'
class MealsController

  def initialize(meal_repository)
    @meals_view = MealsView.new
    @meal_repository = meal_repository
  end

  def add
    # ask for the meal name
    meal_name = @meals_view.ask_for_name
    # ask for the meal price
    meal_price = @meals_view.ask_for_price
    # create an instance of meal
    meal = Meal.new(name: meal_name, price: meal_price)
    # save it in the db
    @meal_repository.create(meal)
  end

  def list
    # get the meals array (REPO)
    meals = @meal_repository.all
    # display the list (VIEW)
    @meals_view.display_list(meals)
  end
end
