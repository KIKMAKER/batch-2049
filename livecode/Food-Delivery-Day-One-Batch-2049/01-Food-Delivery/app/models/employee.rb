class Employee
  attr_accessor :id
  attr_reader :username, :password

  def initialize(attributes)
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def rider?
    @role == "rider"
  end

  def manager?
    @role == "manager"
  end

end

# italo = Employee.new(username: "Italo", password: "secret", role: "rider")

# p italo.rider?
