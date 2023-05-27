require 'blog_repository'

RSpec.describe BlogRepository do
  def reset_tables
    seed_sql = File.read('spec/seeds.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'blog' })
    connection.exec(seed_sql)
  end
  
  before(:each) do 
    reset_tables
  end
  
  context "finding comments by post" do
    it "returns the post" do
      repo = BlogRepository.new
      post = repo.find_with_comments(1)
      expect(post.title).to eq 'Post 1'
      expect(post.comments.length).to eq 2
    end
  end
end
