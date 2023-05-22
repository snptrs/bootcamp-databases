require_relative 'book'

class BookRepository
  def all

    books = []

    sql = "SELECT id, title, author_name FROM books;"
    db = DatabaseConnection.connect('book_store_test')
    result_set = db.exec_params(sql, [])

    result_set.each do |result|
      book = Book.new
      book.id = result['id']
      book.title = result['title']
      book.author_name = result['author_name']

      books << book
    end

    return books
  end
end