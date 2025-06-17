# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @running = true
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
  end

  def run

    while @running
      @current_user = @sessions_controller.login
      # display a different list based on who is logged in
      while @current_user
        if @current_user.manager?
          # ask the user what to do
          print_manager_list
          # get the user action
          user_action = gets.chomp.to_i
          route_manager_action(user_action)

        else
          print_rider_list
          user_action = gets.chomp.to_i
          route_rider_action(user_action)
        end
      end
    end
  end

  def print_manager_list
    puts "What do you want to do:"
    puts "1. Add a meal"
    puts "2. List all meals"
    puts "3. Add a customer"
    puts "4. List all customers"
    puts "5. Other manaager specific"
    puts "8. Logout"
    puts "9. quit"
  end

  def print_rider_list
    puts "What do you want to do:"
    puts "1. rider things"
    puts "2. rider specific things"
    puts "8. Logout"
    puts "9. quit"
  end

  def route_manager_action(user_action)
     # route to the correct controller action
      case user_action
      when 1
        # direct to meals controller add action
        @meals_controller.add
      when 2
        # direct to meals controller list
        @meals_controller.list
      when 3
        # direct to customers controller add action
        @customers_controller.add
      when 4
        # direct to customers controller list
        @customers_controller.list
      when 8
        logout!
      when 9
        puts "quitting"
        quit!
      end
  end

  def route_rider_action(user_action)
      case user_action
      when 1
        puts "do some rider things with the right controllers"
      when 8
        logout!
      when 9
        puts "quitting"
        quit!
      end
  end

  def logout!
    @current_user = nil
  end

  def quit!
    @running = false
    @current_user = nil
  end
end
