require_relative './spec_helper'

describe TrimmerDecorator do
  describe '#correct_name' do
    it 'Should trim the person name if it is longer than 10 characters' do
      person = Person.new 22, 'viniciusjunior'
      trimed_person = TrimmerDecorator.new person

      trimmed = trimed_person.correct_name

      expect(trimmed).to eql 'viniciusju'
    end
  end
end
