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

  def run
    while @running == 1
      puts 'Please select one option'
      @input = gets.chop
      case @input
      when '1'
        puts 'All the objects you created are going to be deleted:'
        puts 'Are you sure you want to close the app? Y/N'
        @input = gets.chop
        @running = 0 if @input.capitalize == 'Y'
      else
        puts 'Enter a valid option'
      end
    end
  end
end

def main
  puts 'Welcome to the OOP school library'
  app = App.new
  app.run
end

main
