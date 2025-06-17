require_relative '../views/sessions_view'
class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @sessions_view = SessionsView.new

  end


  def login
    # ask for employee username
    username = @sessions_view.ask_for("username")
    # ask for employee password
    password = @sessions_view.ask_for("password")
    # find employee in the db (or nil if the username doesn't match anyone)
    user = @employee_repository.find_by_username(username)
    # if their details match
    if user && user.password == password
      # print login confirmation message
      @sessions_view.successful_login(username)
      return user
    else
      # wrong credentials, try again
      @sessions_view.wrong_credentials
      login
    end
  end
end
