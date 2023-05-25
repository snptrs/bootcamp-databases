# Social Network Model and Repository Classes Design Recipe

## 1. Design and create the Table

**Created in social-network-table-design-recipe.md**

## 2. Create Test SQL seeds

Your tests will depend on data stored in PostgreSQL to run.

If seed data is provided (or you already created it), you can skip this step.

```sql
-- (file: spec/seeds_users.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE users RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO users (name, email) VALUES ('Jane Doe', 'janedoe@example.com');
INSERT INTO users (name, email) VALUES ('Jonny Appleseed', 'appleseed@example.com');
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 social_network_test < seeds_users.sql
```


```sql
-- (file: spec/seeds_posts.sql)

-- Write your SQL seed here. 

-- First, you'd need to truncate the table - this is so our table is emptied between each test run,
-- so we can start with a fresh state.
-- (RESTART IDENTITY resets the primary key)

TRUNCATE TABLE posts RESTART IDENTITY; -- replace with your own table name.

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO posts (title, content, view_count, user_id) VALUES ('Post 1', 'Lorem ipsum.', 3, 1);
INSERT INTO posts (title, content, view_count, user_id) VALUES ('Post 2', 'Lorem ipsum dolor sit amet.', 5, 2);
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 social_network_test < seeds_posts.sql
```

## 3. Define the class names

```ruby
# Table name: users

# Model class
# (in lib/user.rb)
class User
end

# Repository class
# (in lib/user_repository.rb)
class UserRepository
end
```

```ruby
# Table name: posts

# Model class
# (in lib/post.rb)
class Post
end

# Repository class
# (in lib/post_repository.rb)
class PostRepository
end
```

## 4. Implement the Model class

Define the attributes of your Model class. You can usually map the table columns to the attributes of the class, including primary and foreign keys.

```ruby
# Table name: users

# Model class
# (in lib/user.rb)

class User
  attr_accessor :id, :name, :email
end

# Table name: posts

# Model class
# (in lib/post.rb)

class Post
  attr_accessor :id, :title, :content, :view_count, :user_id
end

```

## 5. Define the Repository Class interface

```ruby
# Table name: users

# Repository class
# (in lib/user_repository.rb)

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


# Table name: posts

# Repository class
# (in lib/post_repository.rb)

class PostRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, title, content, view_count, user_id FROM posts;

    # Returns an array of Post objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, title, content, view_count_ user_id FROM posts WHERE id = $1;

    # Returns a single Post object.
  end

  def create(post)
    # INSERT INTO posts (id, title, content, view_count_ user_id) VALUES($1, $2, $3, $4, $5);
  end

  def delete(post)
    # DELETE FROM posts WHERE id = $1;
  end
end
```

## 6. Write Test Examples

Write Ruby code that defines the expected behaviour of the Repository class, following your design from the table written in step 5.

These examples will later be encoded as RSpec tests.

```ruby

# User respository

## 1
## Get all users

user_repo = UserRepository.new

users = user_repo.all

users.length # =>  2

users[0].id # =>  1
users[0].name # =>  'Jane Doe'
users[0].email # =>  'janedoe@example.com'

## 2
## Get a single user

user_repo = UserRepository.new

users = user_repo.find(2)

users[0].id # =>  2
users[0].name # =>  'Jonny Appleseed'
users[0].email # =>  'appleseed@example.com'

## 3
## Create a user

user_repo = UserRepository.new
user = User.new
user.name = "Jenny Pip"
user.email = "jennypip@example.com"
user_repo.create(user)
expect(repo.all).to include(have_attributes(name: user.name, email: user.email))

## 4
## Delete a user
user_repo = UserRepository.new
user_repo.delete(1)
users = user_repo.find(1)
# Expect user to not exist


# Post respository

## 1
## Get all posts

post_repo = PostRepository.new
post = post_repo.all

post.length # =>  2
post[0].id # =>  1
post[0].title # =>  'Post 1'
post[0].content # =>  'Lorem ipsum.'
post[0].view_count # => '3'
post[0].user_id # => '1'

## 2
## Get a single post

post_repo = PostRepository.new
posts = post_repo.find(2)

post[1].id # =>  2
post[1].title # =>  'Post 2'
post[1].content # =>  'Lorem ipsum dolor sit amet.'
post[1].view_count # => '5'
post[1].user_id # => '2'

## 3
## Create a post

post_repo = PostRepository.new
post = Post.new
post.title = "Post 3"
post.content = "Oh my god please don't make me write any more of these tests."
post.view_count = 11
post.user_id = 1
expect(post_repo.all).to include(have_attributes(title: post.title, content: post.content, view_count: post.view_count, user_id: post.user_id))

## 4
## Delete a user
post_repo = PostRepository.new
post_repo.delete(1)
posts = post_repo.find(1)
# Expect post to not exist

```


## 7. Reload the SQL seeds before each test run

Running the SQL code present in the seed file will empty the table and re-insert the seed data.

This is so you get a fresh table contents every time you run the test suite.

```ruby
# file: spec/student_repository_spec.rb

def reset_users_table
  seed_sql = File.read('spec/seeds_users.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  # (your tests will go here).
end


# file: spec/post_repository_spec.rb

def reset_posts_table
  seed_sql = File.read('spec/seeds_posts.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do 
    reset_posts_table
  end

  # (your tests will go here).
end
```

## 8. Test-drive and implement the Repository class behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._
