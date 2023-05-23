require_relative 'album_repository'
require_relative 'database_connection'

class App
  def list
    DatabaseConnection.connect('music_library')
    albums = AlbumRepository.new
    albums.all.each do |album|
      puts "#{album.id} – #{album.title} – #{album.artist_id} "
    end
  end
end

app = App.new
app.list
