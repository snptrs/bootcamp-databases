require 'blog_repository'

RSpec.describe BlogRepository do
  def reset_tables
    seed_sql = File.read('spec/seeds_blog_2.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'blog_2' })
    connection.exec(seed_sql)
  end
  
  before(:each) do 
    reset_tables
  end
  
  context "finding post by tag" do
    it "returns the tagged posts" do
      repo = BlogRepository.new
      posts = repo.find_by_tag('coding')
      expect(posts.length).to eq 4
      expect(posts.first.title).to eq "How to use Git"
    end
  end
  
  context "finding tags for posts" do
    it "returns the tags for selected post" do
      repo = BlogRepository.new
      tags = repo.find_by_post(2)
      expect(tags.length).to eq 2
      expect(tags[0].name).to eq 'coding'
      expect(tags[1].name).to eq 'ruby'
    end
  end
end
