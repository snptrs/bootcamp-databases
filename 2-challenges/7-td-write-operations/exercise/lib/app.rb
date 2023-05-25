require_relative 'database_connection'
require_relative 'artist_repository'
require_relative 'albums_repository'

class Application

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    @io.puts "Welcome to the music library manager!"
    @io.puts "What would you like to do?"
    @io.puts " 1 - List all albums"
    @io.puts " 2 - List all artists"
    @io.puts "Enter your choice:"
    choice = @io.gets.chomp

    case choice
    when "1"
      @io.puts "Here is the list of albums:"
      @album_repository.all.each do |album|
        @io.puts "* #{album.id} - #{album.title}"
      end
    end

  end
end


if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumsRepository.new,
    ArtistRepository.new
  )
  app.run
end
