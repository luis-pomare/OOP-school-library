# frozen_string_literal: true
require "pry"

require_relative './app'

def main
  puts "Welcome to the OOP school library\n\n"
  app = App.new
  app.run
  binding.pry
end

main
