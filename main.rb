require_relative './app/app'
require_relative './app/selection'

def main
  puts "Welcome to the OOP school library\n\n"
  selection = Selection.new
  selection.run
end

main
