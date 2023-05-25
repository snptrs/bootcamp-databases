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
      expect(users[0].id).to eq 1
      expect(users[0].name).to eq "Jane Doe"
      expect(users[0].email).to eq "janedoe@example.com"
    end
  end
end

