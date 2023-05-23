require_relative 'album_repository'
require_relative 'database_connection'

class App
  DatabaseConnection.connect('music_library')
  
  def list
    albums = AlbumRepository.new
    albums.all.each do |album|
      puts "#{album.id} – #{album.title} – #{album.artist_id} "
    end
  end
  
  def find(id)
    repo = AlbumRepository.new
    album = repo.find(id)
    puts "#{album.id} – #{album.title} – #{album.artist_id} "
  end
end

app = App.new

puts "===ALL ALBUMS==="
app.list

puts "\nChoose an album by ID:"
id = gets.chomp
app.find(id)
