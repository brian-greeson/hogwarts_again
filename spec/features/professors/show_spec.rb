require "rails_helper"

RSpec.describe "When a user" do
  it "Visits /professors, I see a list of all profressor's name age specialty" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    met = Student.create(name: "Met Potter" , age: 11 , house: "Gryffindor" )
    sally = Student.create(name: "Sally Potter" , age: 11 , house: "Gryffindor" )
    ProfessorStudent.create(student_id: harry, professor_id: snape)
    ProfessorStudent.create(student_id: met, professor_id: snape)
    ProfessorStudent.create(student_id: sally, professor_id: snape)

    visit "/professors/#{snape.id}"

    expect(page).to have_content(harry.name)
    expect(page).to have_content(met.name)
    expect(page).to have_content(sally.name)
  end

end