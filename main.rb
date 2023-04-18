require_relative './app'
require_relative './selection'

def main
  puts "Welcome to the OOP school library\n\n"
  selection = Selection.new
  selection.run
end

main
