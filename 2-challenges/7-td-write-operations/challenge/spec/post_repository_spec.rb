require 'post_repository'

def reset_tables
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

RSpec.describe PostRepository do
  before(:each) do 
    reset_tables
  end

  context "when rerieving posts" do
    it "returns all the posts" do
      post_repo = PostRepository.new
      post = post_repo.all

      expect(post.length).to eq 2
      expect(post[0].id).to eq '1'
      expect(post[0].title).to eq 'Post 1'
      expect(post[0].content).to eq 'Lorem ipsum.'
      expect(post[0].view_count).to eq '3'
      expect(post[0].user_id).to eq '1'
    end

    it "returns a post by id" do
      post_repo = PostRepository.new
      post = post_repo.find(2)

      expect(post[0].id).to eq '2'
      expect(post[0].title).to eq 'Post 2'
      expect(post[0].content).to eq 'Lorem ipsum dolor sit amet.'
      expect(post[0].view_count).to eq '5'
      expect(post[0].user_id).to eq '2'
    end

  end
end