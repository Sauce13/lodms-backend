# seeds.rb

require 'faker'

class Student < ApplicationRecord
  belongs_to :course
end

class Course < ApplicationRecord
  has_many :students
end

# Destroy all existing records to ensure idempotency
# !!! DELETE BEFORE PROD OR STORING DATA
# Course.destroy_all
# Student.destroy_all
# Instructor.destroy_all
# CourseInstructor.destroy_all


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

10.times do 
  Instructor.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email(domain: 'ucdavis.edu'),
  )
end


# for each course, create a new CourseInstructor and assign the id and instructor id to it
Course.find_each do |course|
  # can be anywhere from 1 to 3 instructors each course
  instructor_id = Instructor.pluck(:id).sample(rand(1..3))
  instructor_id.each do |instructor_id|
    CourseInstructor.create!(
      course_id: course.id,
      instructor_id: instructor_id,
    )
  end
end
