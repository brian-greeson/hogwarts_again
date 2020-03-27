require "rails_helper"

RSpec.describe "When a user" do
  it "Visits /students, I see a list of courses and the number of professors each student has" do
    snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
    hagarid = Professor.create(name: "Rubus Hagarid", age: 38 , specialty: "Care of Magical Creatures")
    harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
    met = Student.create(name: "Met Potter" , age: 11 , house: "Gryffindor" )
    sally = Student.create(name: "Sally Potter" , age: 11 , house: "Gryffindor" )
    ProfessorStudent.create(student_id: harry.id, professor_id: snape.id)
    ProfessorStudent.create(student_id: harry.id, professor_id: hagarid.id)
    ProfessorStudent.create(student_id: met.id, professor_id: snape.id)
    # ProfessorStudent.create(student_id: sally.id, professor_id: snape.id)

    visit "/students"

    expect(page).to have_content("#{harry.name}: 2")
    expect(page).to have_content("#{met.name}: 1")
    expect(page).to have_content("#{sally.name}: 0")
  end

end
