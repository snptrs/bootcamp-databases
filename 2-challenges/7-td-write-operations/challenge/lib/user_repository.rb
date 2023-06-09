require_relative 'user'
require_relative 'database_connection'

class UserRepository

  # Selecting all records
  # No arguments
  def all
    sql = 'SELECT id, name, email FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    users = []

    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.name = record['name']
      user.email = record['email']

      users << user
    end
    return users
    # Executes the SQL query:
    # SELECT id, name, email FROM users;

    # Returns an array of User objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, name, email FROM users WHERE id = $1;

    # Returns a single User object.
    sql = 'SELECT id, name, email FROM users WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    users = []

    result_set.each do |record|
      user = User.new
      user.id = record['id']
      user.name = record['name']
      user.email = record['email']

      users << user
    end
    return users
  end

  # Creates a new user record
  # One argument: user object
  def create(user)
    sql = 'INSERT INTO users (name, email) VALUES($1, $2);'
    DatabaseConnection.exec_params(sql, [user.name, user.email])
  end

  def delete(id)
    sql = 'DELETE FROM users WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id])
  end
end