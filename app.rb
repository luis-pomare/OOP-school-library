# frozen_string_literal: true

require_relative './classroom'
require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './book'
require 'pry'

# APP method to manage the entire codebase
class App
  attr_reader :books

  def initialize
    @running = 1
    @input = 0
    @books = []
    @students = []
    @teachers = []
    @rentals = []
  end

  def read_input
    @input = gets.chop
  end

  def exit_app
    puts "\nAll the objects you created will be deleted:"
    puts 'Are you sure you want to close the app? Y/N'
    read_input
    @running = 0 if @input.capitalize == 'Y' || @input.upcase == 'YES'
    puts "\n"
  end

  def insert_book
    puts "\n Plese insert the title of the book"
    title = gets.chop
    puts "\n Plese insert the author of the book"
    author = gets.chop
    @books.push(Book.new(title, author))
  end

  def default
    puts "\nYou selected an invalid option\n"
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
    else default
    end
  end

  def verify_rental
    if @teachers.empty? && @students.empty?
      puts "\nYou can't add rentals without people subscribed to the library"
      return 1
    end
    if @books.empty?
      puts "\nYou can't add rentals without any book in your library"
      return 2
    end
    return 3
  end

  def read_rental_date
    puts "Please insert the date of the rental:"
    return gets.chop
  end

  def read_rental_book
    puts "Please select one of the following books:\n"
    @books.each_with_index do |entry, index| 
      puts "#{index+1}. For #{entry.title} by #{entry.author}"
    end
    return gets.chop
  end
  
  def show_rental_people
    puts "Please select one of the following users:\n"
    counter = 1
    @students.each_with_index do |entry, index|
      counter += 1 
      puts "#{index+1}. For #{entry.name} type: Student ID: #{entry.id}"
    end
    @teachers.each_with_index do |entry, index|
      puts "#{index+counter}. For #{entry.name} type: Teacher ID: #{entry.id}"
    end
  end

  def read_rental_person
    show_rental_people
    people = [*@students, *@teachers]
    position = gets.chop
    return people[position.to_i - 1] 
  end
  
  def insert_rental
    if verify_rental == 3
      date = read_rental_date
      book = @books[read_rental_book.to_i-1]
      person = read_rental_person
      binding.pry
      @rentals.push(Rental.new(date, book, person))
    end
  end

  def select
    case @input
    when '3' then create_person
    when '4' then insert_book
    when '5' then insert_rental
    when '7' then exit_app
    else default
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
  end

  def run
    while @running == 1
      show_options
      read_input
      select
    end
  end
end
