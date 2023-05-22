require_relative 'book_repository'

class App
  def list
    repo = BookRepository.new
    books = repo.all

    books.each do |book|
      puts "#{book.id} - #{book.title} - #{book.author_name}"
    end
  end
end

app = App.new
app.list