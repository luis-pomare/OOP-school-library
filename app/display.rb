require_relative 'list_by_id'
require_relative 'database'
# Manage all strings
class Display < ListById
  include Database
  def exit_app
    puts "\nAll the objects you created will be preserved:"
    puts 'Are you sure you want to close the app? Y/N'
    read_input

    if @input.capitalize == 'Y' || @input.upcase == 'YES'
      @running = 0
      preserve_data
    end
    puts "\n"
  end

  def insert_book
    puts "\n Plese insert the title of the book"
    title = gets.chop
    puts "\n Plese insert the author of the book"
    author = gets.chop
    @books.push(Book.new(title, author))
  end

  def create_student
    puts "\nPlease enter the students' name:"
    name = gets.chop
    puts "\nPlease enter the students' age:"
    age = gets.chop
    puts "\nDoes the student have parent permission?\n\n    1. For \"Yes\"
    2. For \"No\""
    permission = gets.chop == '1'
    @students.push(Student.new(age, permission, name))
  end

  def create_teacher
    puts "\nPlease enter the teacher's name:"
    name = gets.chop
    puts "\nPlease enter the teacher's age:"
    age = gets.chop
    puts "\nPlease enter the teacher's specialization:"
    specialization = gets.chop
    @teachers.push(Teacher.new(specialization, age, name))
  end

  def create_person
    puts "\n Please select one of the following options:\n
    1. For \"create a student\"
    2. For \"create a teacher\"\n"
    read_input
    case @input
    when '1' then create_student
    when '2' then create_teacher
    else "\nYou din't sected a valid option\n"
    end
  end

  def show_options
    puts "Please select one of the following options:\n
    1. For \"list all books\"
    2. For \"list all students and teachers\"
    3. For \"create a new library user\"
    4. For \"insert a new book\"
    5. For \"new rental\"
    6. For \"list all rentals from a given persons' ID\"
    7. For \"exit'\n"
    puts "\n\n"
  end

  def list_all_books
    puts "\n"
    if @books.empty? == false
      @books.each_with_index do |book, index|
        puts "#{index + 1}. #{book.title} by #{book.author}"
      end
    else
      puts 'Empty library'
    end
    puts "\n"
  end

  def list_students
    @students.each_with_index do |student, index|
      puts "#{index + 1}. #{student.name} Age: #{student.age}"
    end
  end

  def list_teachers
    @teachers.each_with_index do |teacher, index|
      puts "#{index + 1}. #{teacher.name} Age: #{teacher.age}"
    end
  end

  def list_users
    if @students.empty? == false || @teachers.empty? == false
      puts 'Students:'
      list_students
      puts 'Teachers:'
      list_teachers
    else
      puts "There is not people to show\n"
    end
  end
end
