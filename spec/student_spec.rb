require_relative './spec_helper.rb'

describe Student do
  
  before :each do
    @student = Student.new 17, true, 'Daniel Klien'
  end
 
  describe '#new' do
    it 'Should return a Student object' do
      expect(@student).to be_an_instance_of Student
    end
  end

  describe '#classroom' do
  
  it 'Should return the student classroom' do
    classroom = Classroom.new("Class A")
    @student.classroom = classroom
    readed_classroom = @student.classroom
    
      expect(readed_classroom).to eql classroom 
    end
  end

  describe '#name' do
    it 'Should return the correct name' do
      name =  @student.name

      expect(name).to eql 'Daniel Klien'
    end
  end

  describe '#age' do
    it 'Should return the correct age' do
      age =  @student.age

      expect(age).to eql 17
    end
  end

  describe '#play_hooky' do
    it 'Should return hooky pattern' do
      pattern = @student.play_hooky
      expect(pattern).to eql '¯(ツ)/¯'
    end
  end
end
