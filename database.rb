require 'json'
module Database
  # Save data
  def preserve_data
    preserve_books
    preserve_people
    preserve_rentals
  end

  def preserve_books
    book_objects=[]
    @books.each {|book| book_objects<< {title:book.title,author: book.author} }
    File.write('books.json', book_objects.to_json)
  end

  def preserve_people
    people_objects = []
    @students.each {|student| people_objects << {age: student.age, parent_permission: student.parent_permission, name: student.name, id: student.id, type: 'Student'}}
    @teachers.each {|teacher| people_objects << {age: teacher.age, specialization: teacher.specialization, name: teacher.name, id: teacher.id, type: 'Teacher'}}
    File.write('people.json', people_objects.to_json)
  end

  def preserve_rentals
    rental_objects = []
    @rentals.each do |rental|
      # date, book, person
      book = {title:rental.book.title,author: rental.book.author}
      person = nil
      if rental.person.class.name == "Student"
        person = {age: rental.person.age, parent_permission: rental.person.parent_permission, name: rental.person.name, id: rental.person.id, type: 'Student'}
      else
        person = {age: rental.person.age, specialization: rental.person.specialization, name: rental.person.name, id: rental.person.id, type: 'Teacher'}
      end
      rental_objects << {date: rental.date,book: book,person:person}
    end
    File.write('rentals.json', rental_objects.to_json)
  end

  #load data
  def load_books
    books = []
    if File.exist?("books.json") && !File.empty?("books.json")
      data = JSON.parse(File.read("books.json"))
      data.each {|book| books << Book.new(book['title'], book['author'])}
    end
    books
  end
end
