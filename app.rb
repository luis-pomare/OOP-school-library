# frozen_string_literal: true

require_relative './classroom'
require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './book'

# APP method to manage the entire codebase
class App
  def initialize
    @running = 1
    @input = 0
  end

  def case7
    puts "\nAll the objects you created will be deleted:"
    puts 'Are you sure you want to close the app? Y/N'
    @input = gets.chop
    if (@input.capitalize == 'Y' || @input.upcase == 'YES')
      @running = 0
    end
    puts "\n"
  end

  def default
    puts "\nYou selected an invalid option\n"
  end
  
  def select
    case @input
    when '7' then case7
    else default
    end
  end
  
  def show_options
    puts "Please select one of the following options:\n
    1. For \"list all books\"\n
    2. For \"list all students and teachers\"\n
    3. For \"create a new library user\"\n
    4. For \"insert a new book\"\n
    5. For \"new rental\"\n
    6. For \"list all rentals from a given persons' ID\"\n
    7. For \"exit'\n
    "
  end
  
  def run
    while @running == 1
      show_options
      @input = gets.chop
      select
    end
  end
end
