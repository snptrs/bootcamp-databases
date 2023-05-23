require_relative 'book_repository'
require_relative 'database_connection'

class App
  def list
    DatabaseConnection.connect('book_store')
    repo = BookRepository.new
    books = repo.all

    books.each do |book|
      puts "#{book.id} - #{book.title} - #{book.author_name}"
    end
  end
end

app = App.new
app.list