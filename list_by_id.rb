# frozen_string_literal: true

# List by Id
class List_by_id
  def show_rentals_ids(people)
    puts "\nPlease insert one of the followins IDs:"
    people.each do |person|
      puts "ID: #{person.id} Name: #{person.name} Age: #{person.age}"
    end
  end

  def verify_rentals_ids
    people = [*@students, *@teachers]
    if people.empty? then puts "\nThere are no users\n"
    else show_rentals_ids(people)
    end
  end

  def list_rentals
    verify_rentals_ids
  end
end