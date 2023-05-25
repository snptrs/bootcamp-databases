require_relative 'user'
require_relative 'database_connection'

class UserRepository

  # Selecting all records
  # No arguments
  def all
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
  end

  # Creates a new user record
  # One argument: user object
  def create(user)
    # INSERT INTO users (name, email) VALUES($1, $2);

    # Returns nothing [?]
  end

  def delete(user)
    # DELETE FROM users WHERE id = $1;
  end
end