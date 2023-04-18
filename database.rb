require 'json'
module Database
  
  def preserve_books
    book_objects=[]
    @books.each {|book| book_objects<< {title:book.title,author: book.author} }
    File.write('books.json', book_objects.to_json)
  end
end