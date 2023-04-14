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
    @imput = 1
  end

  def case1
    puts 'All the objects you created will be deleted:'
    puts 'Are you sure you want to close the app? Y/N'
    @input = gets.chop
    @running = 0 if @input.capitalize == 'Y'
  end

  def select
    case @input
    when '1'
      case1
    else
      puts 'Enter a valid option'
    end
  end

  def run
    while @running == 1
      puts 'Please select one option'
      @input = gets.chop
      select
    end
  end
end
