require 'faker'

# Clear existing data
CourseStudent.delete_all
CourseInstructor.delete_all
Course.delete_all
Department.delete_all
Instructor.delete_all
ProgramAdmin.delete_all
Student.delete_all

# Seed Departments
departments = ['Computer Science', 'Mathematics', 'Physics', 'Biology', 'Chemistry']
departments.each do |name|
  Department.create!(name: name)
end

# Seed Instructors
10.times do
  Instructor.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email(domain: 'ucdavis.edu')
  )
end

# Seed Program Admins
5.times do
  ProgramAdmin.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email(domain: 'ucdavis.edu')
  )
end

# Seed Courses and CourseStudents
20.times do
  course1 = Course.create!(
    name: Faker::Educator.course_name,
    crn: Faker::Number.unique.number(digits: 5)
  )
  
  course2 = Course.create!(
    name: Faker::Educator.course_name,
    crn: Faker::Number.unique.number(digits: 5)
  )

  rand(1..3).times do
    instructor = Instructor.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email(domain: 'ucdavis.edu')
    )

    if rand(2).zero?
    CourseInstructor.create!(
      course_id: course1.id,
      instructor_id: instructor.id
    )
    end

    if rand(2).zero?
      CourseInstructor.create!(
        course_id: course2.id,
        instructor_id: instructor.id
      )
    end
  end

  # Seed CourseStudents
  rand(10..30).times do
    student = Student.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email(domain: 'ucdavis.edu')
    )

    if rand(2).zero? # Randomly decide whether to enroll the student in course1
      CourseStudent.create!(
        course_id: course1.id,
        student_id: student.id
      )
    end

    if rand(2).zero? # Randomly decide whether to enroll the student in course2
      CourseStudent.create!(
        course_id: course2.id,
        student_id: student.id
      )
    end
  end
end
