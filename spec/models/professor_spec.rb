require 'rails_helper'

RSpec.describe Professor, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :specialty}
  end

  describe 'relationships' do
    it {should have_many :professor_students}
    it {should have_many(:students).through(:professor_students)}
  end

  describe "Instance methods" do
    it ".students_average_age" do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      met = Student.create(name: "Met Potter" , age: 12 , house: "Gryffindor" )
      sally = Student.create(name: "Sally Potter" , age: 13 , house: "Gryffindor" )
      ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: met.id, professor_id: snape.id)
      ProfessorStudent.create(student_id: sally.id, professor_id: snape.id)


      expect(snape.students_average_age).to eq(12.0)

      billy = Student.create(name: "Billy Potter" , age: 13 , house: "Gryffindor" )
      ProfessorStudent.create(student_id: billy.id, professor_id: snape.id)
      snape.reload

      expect(snape.students_average_age).to eq(12.25)


    end

  end
end
