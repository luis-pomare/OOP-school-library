# frozen_string_literal: true

# Manage all strings
class Display
  def create_student
    puts "\nPlease enter the students' name:"
    name = gets.chop
    puts "\nPlease enter the students' age:"
    age = gets.chop
    puts "\nDoes the student have parent permission?\n\n    1. For \"Yes\"
    2. For \"No\""
    permission = gets.chop == '1'
    @students.push(Student.new(age, permission, name))
  end

  def create_teacher
    puts "\nPlease enter the teacher's name:"
    name = gets.chop
    puts "\nPlease enter the teacher's age:"
    age = gets.chop
    puts "\nPlease enter the teacher's specialization:"
    specialization = gets.chop
    @teachers.push(Teacher.new(specialization, age, name))
  end

  def create_person
    puts "\n Please select one of the following options:\n
    1. For \"create a student\"
    2. For \"create a teacher\"\n"
    read_input
    case @input
    when '1' then create_student
    when '2' then create_teacher
    else default
    end
  end

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
