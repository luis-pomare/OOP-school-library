require_relative './spec_helper'

describe Classroom do
  before :each do
    @classroom = Classroom.new 'Class A'
  end

  describe '#new' do
    it 'Should return a Classroom object' do
      expect(@classroom).to be_an_instance_of Classroom
    end
  end

  describe '#label' do
    it 'Should return the correct classroom label' do
      readed_label = @classroom.label

      expect(readed_label).to eql 'Class A'
    end
  end

  describe '#students' do
    it 'Should return a empty array' do
      readed_students = @classroom.students

      expect(readed_students).to be_an_instance_of Array
      expect(readed_students.length).to eql 0
    end
  end

  describe '#add_student' do
    it 'Should add a new student' do
      student = Student.new 17, true, 'Daniel Klien'
      @classroom.add_student(student)
      expect(@classroom.students.include?(student)).to be true
    end
  end
end
