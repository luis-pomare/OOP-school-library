# frozen_string_literal: true

require_relative './classroom'
require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './book'
require_relative 'display'

# APP method to manage the entire codebase
class App < Display
  attr_reader :books

  def initialize
    @running = 1
    @input = 0
    @books = []
    @students = []
    @teachers = []
    @rentals = []
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

  def select1
    case @input
    when '4' then insert_book
    when '5' then insert_rental
    when '6' then verify_rentals_ids
    when '7' then exit_app
    end
  end

  def select
    case @input
    when '1' then list_all_books
    when '2' then list_users
    when '3' then create_person
    else select1
    end
  end

  def run
    while @running == 1
      show_options
      read_input
      select
    end
  end
end
