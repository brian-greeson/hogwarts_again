require "rails_helper"

RSpec.describe "When a user" do
  it "Visits /professors/:professor_id, I see a list of the names of the students the professors have" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    met = Student.create(name: "Met Potter" , age: 11 , house: "Gryffindor" )
    sally = Student.create(name: "Sally Potter" , age: 11 , house: "Gryffindor" )
    ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
    ProfessorStudent.create(student_id: met.id, professor_id: snape.id)
    ProfessorStudent.create(student_id: sally.id, professor_id: snape.id)

    visit "/professors/#{snape.id}"

    expect(page).to have_content(harry.name)
    expect(page).to have_content(met.name)
    expect(page).to have_content(sally.name)
  end

end
