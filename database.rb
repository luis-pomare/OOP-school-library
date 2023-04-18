require 'json'
module Database
  
  def preserve_data
    preserve_books
    preserve_people
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
    File.write('people.json', people_objects)
  end
end
