# frozen_string_literal: true

require_relative './classroom'
require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './book'
require_relative 'display'
require_relative 'database'

# APP method to manage the entire codebase
class App < Display
  attr_reader :books

  include Database
  
  def initialize
    @running = 1
    @input = 0
    @books = load_books
    @students = load_students
    @teachers = []
    @rentals = load_rentals
    super()
  end

  def read_input
    @input = gets.chop
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
    3
  end

  def read_rental_date
    puts 'Please insert the date of the rental:'
    gets.chop
  end

  def read_rental_book
    puts "Please select one of the following books:\n"
    @books.each_with_index do |entry, index|
      puts "#{index + 1}. For #{entry.title} by #{entry.author}"
    end
    gets.chop
  end

  def show_rental_people
    puts "Please select one of the following users:\n"
    counter = 1
    @students.each_with_index do |entry, index|
      counter += 1
      puts "#{index + 1}. For #{entry.name} type: Student ID: #{entry.id}"
    end
    @teachers.each_with_index do |entry, index|
      puts "#{index + counter}. For #{entry.name} type: Teacher ID: #{entry.id}"
    end
  end

  def read_rental_person
    show_rental_people
    people = [*@students, *@teachers]
    position = gets.chop
    people[position.to_i - 1]
  end

  def insert_rental
    return unless verify_rental == 3

    date = read_rental_date
    book = @books[read_rental_book.to_i - 1]
    person = read_rental_person
    @rentals.push(Rental.new(date, book, person))
  end
end
