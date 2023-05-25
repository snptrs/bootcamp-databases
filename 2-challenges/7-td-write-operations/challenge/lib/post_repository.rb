require_relative 'post'
require_relative 'database_connection'

class PostRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    sql = "SELECT id, title, content, view_count, user_id FROM posts;"
    result_set = DatabaseConnection.exec_params(sql, [])

    posts = []

    result_set.each do |record|
      post = Post.new
      post.id = record['id']
      post.title = record['title']
      post.content = record['content']
      post.view_count = record['view_count']
      post.user_id = record['user_id']

      posts << post
    end
    return posts

    # Returns an array of Post objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(id)
    # Executes the SQL query:
    # SELECT id, title, content, view_count_ user_id FROM posts WHERE id = $1;
    sql = "SELECT id, title, content, view_count, user_id FROM posts WHERE id = $1;"
    result_set = DatabaseConnection.exec_params(sql, [id])

    posts = []

    result_set.each do |record|
      post = Post.new
      post.id = record['id']
      post.title = record['title']
      post.content = record['content']
      post.view_count = record['view_count']
      post.user_id = record['user_id']

      posts << post
    end
    return posts
  end

  def create(post)
    sql = "INSERT INTO posts (title, content, view_count, user_id) VALUES($1, $2, $3, $4);"
    DatabaseConnection.exec_params(sql, [post.title, post.content, post.view_count, post.user_id])
  end

  def delete(id)
    sql = "DELETE FROM posts WHERE id = $1;"
    DatabaseConnection.exec_params(sql, [id])
  end
end