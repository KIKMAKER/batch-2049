class SessionsView
  def ask_for(something)
    puts "What is your #{something}?"
    gets.chomp
  end

  def successful_login(username)
    puts "Welcome #{username}! You are logged in"
  end

  def wrong_credentials
    puts "Wrong credentials, try again!"
  end
end
