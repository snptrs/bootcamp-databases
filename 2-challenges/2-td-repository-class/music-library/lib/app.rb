require_relative 'album_repository'

class App
  def list
    albums = AlbumRepository.new
    list = albums.all
    albums.all.each do |album|
      puts "#{album.id} – #{album.title} – #{album.artist_id} "
    end
  end
end

app = App.new
app.list
