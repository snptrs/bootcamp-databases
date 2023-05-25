require 'app'

RSpec.describe do
  it "prompts the user for input" do
    io = double :io
    expect(io).to receive(:puts).with("Welcome to the music library manager!").ordered
    expect(io).to receive(:puts).with("What would you like to do?").ordered
    expect(io).to receive(:puts).with(" 1 - List all albums").ordered
    expect(io).to receive(:puts).with(" 2 - List all artists").ordered
    expect(io).to receive(:puts).with("Enter your choice:").ordered
    expect(io).to receive(:gets).and_return("1").ordered
    expect(io).to receive(:puts).with("Here is the list of albums:").ordered
    
    app = Application.new(
      'music_library',
      io,
      AlbumsRepository.new,
      ArtistRepository.new
    )
    app.run
  end
end