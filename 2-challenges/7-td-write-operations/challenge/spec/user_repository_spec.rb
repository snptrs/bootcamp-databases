require 'user_repository'

def reset_users_table
  seed_sql = File.read('spec/seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network_test' })
  connection.exec(seed_sql)
end

RSpec.describe UserRepository do
  before(:each) do 
    reset_users_table
  end

  context "when retrieving users" do
    it "returns all the users" do
      user_repo = UserRepository.new
      users = user_repo.all

      expect(users.length).to eq 2
      expect(users[0].id).to eq "1"
      expect(users[0].name).to eq "Jane Doe"
      expect(users[0].email).to eq "janedoe@example.com"
    end

    it "returns a selected user by id" do
      user_repo = UserRepository.new
      users = user_repo.find(2)

      expect(users.length).to eq 1
      expect(users[0].id).to eq "2"
      expect(users[0].name).to eq "Jonny Appleseed"
      expect(users[0].email).to eq "appleseed@example.com"
    end
  end

  context "when adding a user" do
    it "adds them to the database" do
      user_repo = UserRepository.new
      user = User.new
      user.name = "Jenny Pip"
      user.email = "jennypip@example.com"
      user_repo.create(user)
      expect(user_repo.all).to include(have_attributes(name: user.name, email: user.email))
    end
  end

  context "when deleting a user" do
    it "removes them from the database" do
      user_repo = UserRepository.new
      user_repo.delete(1)
      users = user_repo.find(1)
      expect(users.length).to eq 0
    end
  end
end

