# seeds.rb

require 'faker'

# class Student < ApplicationRecord
#   belongs_to :course
# end

# class Course < ApplicationRecord
#   has_many :students
# end

# Destroy all existing records to ensure idempotency
# !!! DELETE BEFORE PROD OR STORING DATA
# Course.destroy_all
# Student.destroy_all
# Instructor.destroy_all
# CourseInstructor.destroy_all
# ProgramAdmin.destroy_all

student_users = 50.times.map do
  User.create!(
    role: 'student'
  )
end

instructor_users = 20.times.map do
  User.create!(
    role: 'instructor'
  )
end

program_admin_users = 10.times.map do
  User.create!(
    role: 'program_admin'
  )
end

10.times do
  Department.create!(
    department_name: Faker::University.name
  )
end
departments = Department.all

departments.each do |department|
  3.times do 
    DepartmentLevelLearningOutcome.create!(
      outcome_description: Faker::Lorem.sentence,
      department: department
    )
  end
end
outcomes = DepartmentLevelLearningOutcome.all

outcomes.each do |outcome|
  5.times do 
    PerformanceIndicator.create!(
      indicator_description: Faker::Lorem.sentence,
      department_level_learning_outcome: outcome
    )
  end
end

instructor_users.each do |user|
  Instructor.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email(domain: 'ucdavis.edu'),
    department: departments.sample,
    user: user
  )
end

program_admin_users.each do |user|
  ProgramAdmin.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email(domain: 'ucdavis.edu'),
    department: departments.sample, 
    user: user
  )
end


50.times do
  course = Course.create!(
    name: Faker::Educator.course_name,
    crn: Faker::Number.unique.number(digits: 5),
    subject_area: Faker::Educator.subject,
    instructor: Faker::Name.name,
    college: "Letters and Science"
  )
  instructor = Instructor.order('RANDOM()').first
  CourseInstructor.create!(
    course: course,
    instructor: instructor
  )
end

student_users.each do |user|
  student = Student.create!(
    name: Faker::Name.name, 
    email: Faker::Internet.email(domain: 'ucdavis.edu'),
    user: user
  )
  course = Course.order('RANDOM()').first
  CourseStudent.create!(
    student: student,
    course: course,
    enrollment_date: Faker::Date.backward(days: 365)
  )
end

Course.all.each do |course|
  PerformanceIndicator.limit(rand(1..3)).each do |pi|
    CoursePerformanceIndicator.create!(
      course: course,
      performance_indicator: pi

end


  # Create 30 students for each course
30.times do
    Student.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email(domain: 'ucdavis.edu'),    )
end

10.times do 
  course_rubric_item = CourseRubricItem.create!(
    rubric_item: Faker::Lorem.sentence
  )
  CoursePerformanceIndicator.limit(rand(1..3)).each do |cpi|
    course_rubric_item.course_performance_indicators << cpi
  end
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

  student_id = Student.pluck(:id).sample(rand(1..3))
  student_id.each do |student_id|
    CourseStudent.create!(
      course_id: course.id,
      student_id: student_id,
    )
  end
end

50.times do
  assignment = Assignment.create!(
    data_taken: Faker::Date.backward(days: 365), 
    course: Course.order('RANDOM()').first,
  )
  assignment.course_rubric_items << CourseRubricItem.order('RANDOM()').first
  assignment.course_students << CourseStudent.order('RANDOM()').first
  assignment.program_level_rubric_items << ProgramLevelRubricItem.order('RANDOM()').first
end