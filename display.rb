# frozen_string_literal: true

# Manage all strings
class Display

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

  def select
    case @input
    when '3' then create_person
    when '4' then insert_book
    when '5' then insert_rental
    when '7' then exit_app
    else default
    end
  end

end
