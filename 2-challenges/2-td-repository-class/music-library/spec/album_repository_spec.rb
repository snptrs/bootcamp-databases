require 'album_repository'

RSpec.describe AlbumRepository do
  def reset_albums_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end
  
  before(:each) do 
    reset_albums_table
  end
  
  it "returns two albums" do
    repo = AlbumRepository.new
    albums = repo.all
    
    expect(albums.length).to eq(2)
    expect(albums.last.title).to eq('Blonde on Blonde')
    expect(albums.last.release_year).to eq('1966')
    expect(albums.last.artist_id).to eq('1')
  end
  
  it "returns an album by id" do
    repo = AlbumRepository.new
    album = repo.find(1)
    
    expect(album.title).to eq('Trompe le Monde')
    expect(album.release_year).to eq('1991')
    expect(album.artist_id).to eq('2')
  end
end
