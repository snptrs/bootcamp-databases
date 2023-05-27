require_relative 'post'
require_relative 'comment'

class BlogRepository
  def find_with_comments(post)
    
    sql = 'SELECT posts.id,
         posts.title,
         posts.content,
         comments.id AS comment_id,
         comments.comment AS comment_content,
         comments.date AS comment_date
    FROM posts
    JOIN comments ON comments.post_id = posts.id
    WHERE posts.id = $1;'
    params = [post]
    result = DatabaseConnection.exec_params(sql, params)
    
    post = Post.new
    
    post.id = result.first['id']
    post.title = result.first['title']
    post.content = result.first['content']
    
    result.each do |record|
      comment = Comment.new
      comment.id = record['comment_id']
      comment.content = record['comment_content']
      comment.date = record['comment_date']
      
      post.comments << comment
    end
    return post
  end
end
