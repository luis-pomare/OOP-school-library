# frozen_string_literal: true

# List by Id
class ListByid
  def show_selected_rentals(people)
    person_id = gets.chop
    people.each do |person|
      next unless person.id == person_id.to_i

      person.rentals.each do |curren|
        puts "#{curren.date} #{curren.person.name} #{curren.book.title}"
      end
    end
  end

  def show_rentals_ids(people)
    puts "\nPlease insert one of the followins IDs:"
    people.each do |person|
      puts "ID: #{person.id} Name: #{person.name} Age: #{person.age}"
    end
    show_selected_rentals(people)
  end

  def verify_rentals_ids
    people = [*@students, *@teachers]
    if people.empty? then puts "\nThere are no users\n"
    else
      show_rentals_ids(people)
    end
  end
end
