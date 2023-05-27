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
  
  def find_by_post(post)
    
    sql = 'SELECT tags.id, tags.name
      FROM tags 
      JOIN posts_tags ON posts_tags.tag_id = tags.id
      JOIN posts ON posts_tags.post_id = posts.id
      WHERE posts.id = $1;'
  
    params = [post]
    results = DatabaseConnection.exec_params(sql, params)
    
    tags = []
    
    results.each do |result|
      tag = Tag.new
      
      tag.id = result['id']
      tag.name = result['name']
      
      tags << tag
    
    end
    return tags
  end
end
