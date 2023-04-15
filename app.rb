# frozen_string_literal: true

require_relative './classroom'
require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './book'

# APP method to manage the entire codebase
class App
  attr_reader :books

  def initialize
    @running = 1
    @input = 0
    @books = []
    @students = []
    @teachers = []
  end

  def exit_app
    puts "\nAll the objects you created will be deleted:"
    puts 'Are you sure you want to close the app? Y/N'
    @input = gets.chop
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

  def select
    case @input
    when '4' then insert_book
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
      @input = gets.chop
      select
    end
  end
end
