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

  context "when adding a new post" do
    it "adds the post to the database" do
      post_repo = PostRepository.new
      post = Post.new
      post.title = "Post 3"
      post.content = "Oh my god please dont make me write any more of these tests."
      post.view_count = "11"
      post.user_id = "1"
      post_repo.create(post)
      expect(post_repo.all).to include(have_attributes(title: "Post 3", content: "Oh my god please dont make me write any more of these tests.", view_count: "11", user_id: "1"))
    end
  end

  context "when deleting a post" do
    it "removes the post from the database" do
      post_repo = PostRepository.new
      post_repo.delete(1)
      posts = post_repo.find(1)
      expect(posts.length).to eq 0
    end
  end
end