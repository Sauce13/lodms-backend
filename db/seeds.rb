# seeds.rb

require 'faker'

class Student < ApplicationRecord
  belongs_to :course
end

class Course < ApplicationRecord
  has_many :students
end

# Destroy all existing records to ensure idempotency
Course.destroy_all
Student.destroy_all

# Create 20 courses
50.times do
  course = Course.create!(
    name: Faker::Educator.course_name,
    crn: Faker::Number.unique.number(digits: 5),
    subject_area: Faker::Educator.subject,
    instructor: Faker::Name.name,
    college: "Letters and Science"
  )

  # Create 30 students for each course
  30.times do
    course.students.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email(domain: 'ucdavis.edu'),
    )
  end
end
