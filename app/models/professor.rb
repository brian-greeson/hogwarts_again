class Professor < ApplicationRecord
  validates_presence_of :name, :age, :specialty
  has_many :professor_students
  has_many :students,  through: :professor_students

  def students_average_age
    total_age = students.reduce([]) do |student_ages,student|
      student_ages <<  student.age
      student_ages
    end.sum
    total_age.to_f / students.count
  end
end
