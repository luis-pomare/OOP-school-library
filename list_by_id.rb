# List by Id
class ListById
  def show_selected_rentals
    person_id = gets.chop
    puts "\nRentals\n"
    @rentals.each do |rental|
      puts "#{rental.date} #{rental.person.name} #{rental.book.title}" if person_id.to_i == rental.person.id
    end
    puts "\n\n"
  end

  def verify_rentals_ids
    people = [*@students, *@teachers]
    if people.empty? then puts "\nThere are no users\n"
    else
      puts "\nPlease insert one of the followins IDs:"
      people.each do |person|
        puts "ID: #{person.id} Name: #{person.name} Age: #{person.age}"
      end
      show_selected_rentals
    end
  end
end
