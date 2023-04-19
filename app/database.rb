require 'json'
# Database Module
module Database
  # Save data
  def preserve_data
    preserve_books
    preserve_people
    preserve_rentals
  end

  def preserve_books
    book_objects = []
    @books.each { |book| book_objects << { title: book.title, author: book.author } }
    File.write('./json/books.json', book_objects.to_json)
  end

  def preserve_people
    people_objects = []
    @students.each do |student|
      people_objects << { age: student.age, parent_permission: student.parent_permission, name: student.name,
                          id: student.id, type: 'Student' }
    end
    @teachers.each do |teacher|
      people_objects << { age: teacher.age, specialization: teacher.specialization, name: teacher.name, id: teacher.id,
                          type: 'Teacher' }
    end
    File.write('./json/people.json', people_objects.to_json)
  end

  def preserve_rentals
    rental_ojects = []
    @rentals.each do |rental|
      rental_book = { title: rental.book.title, author: rental.book.author }
      rental_person = if rental.person.instance_of?(::Student)
                        { age: rental.person.age, classroom: rental.person.classroom, name: rental.person.name,
                          id: rental.person.id, type: 'Student' }
                      else
                        { age: rental.person.age,
                          specialization: rental.person.specialization, name: rental.person.name,
                          id: rental.person.id, type: 'Teacher' }
                      end
      rental_ojects << { date: rental.date, book: rental_book, person: rental_person }
    end
    File.write('./json/rentals.json', rental_ojects.to_json)
  end

  # load data
  def load_books
    books = []
    if File.exist?('./json/books.json') && !File.empty?('./json/books.json')
      data = JSON.parse(File.read('./json/books.json'))
      data.each { |book| books << Book.new(book['title'], book['author']) }
    end
    books
  end

  def load_rentals
    rentals = []
    if File.exist?('./json/rentals.json') && !File.empty?('./json/rentals.json')
      data = JSON.parse(File.read('./json/rentals.json'))
      data.each do |rental|
        book = Book.new(rental['book']['title'], rental['book']['author'])
        person = if rental['person']['type'] == 'Student'
                   Student.new(rental['person']['age'], rental['person']['parent_permission'], rental['person']['name'])
                 else
                   Teacher.new(rental['person']['specialization'], rental['person']['age'], rental['person']['name'])
                 end
        person.id = rental['person']['id']
        rentals << Rental.new(rental['date'], book, person)
      end
    end
    rentals
  end

  def load_students
    students = []
    if File.exist?('./json/people.json') && !File.empty?('./json/people.json')
      data = JSON.parse(File.read('./json/people.json'))
      data.each do |people|
        next unless people['type'] == 'Student'

        person = Student.new(people['age'], people['parent_permission'], people['name'])
        person.id = people['id']
        students << person
      end
    end
    students
  end

  def load_teachers
    teachers = []
    if File.exist?('./json/people.json') && !File.empty?('./json/people.json')
      data = JSON.parse(File.read('./json/people.json'))
      data.each do |people|
        next unless people['type'] == 'Teacher'

        person = Teacher.new(people['specialization'], people['age'], people['name'])
        person.id = people['id']
        teachers << person
      end
    end
    teachers
  end
end
