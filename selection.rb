# frozen_string_literal: true

require_relative './app'
# Display the menu for the user
class Selection < App
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
