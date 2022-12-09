require 'csv'
class BooksUploadPresenter
  def initialize csv_string
    @books = CSV.parse(csv_string)
  end

  def headers
    @books[0]
  end

  def rows
    @books.drop(1)
  end
end