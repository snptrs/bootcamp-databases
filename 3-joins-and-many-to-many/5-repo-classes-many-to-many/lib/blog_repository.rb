require_relative 'post'
require_relative 'tag'

class BlogRepository
  def find_by_tag(tag)
    
    sql = 'SELECT posts.id, posts.title
      FROM posts 
      JOIN posts_tags ON posts_tags.post_id = posts.id
      JOIN tags ON posts_tags.tag_id = tags.id
      WHERE tags.name = $1;'
  
    params = [tag]
    results = DatabaseConnection.exec_params(sql, params)
    
    posts = []
    
    results.each do |result|
      post = Post.new
      
      post.id = result['id']
      post.title = result['title']
      
      posts << post
    
    end
    return posts
  end
end
