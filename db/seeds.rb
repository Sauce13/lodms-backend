# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Course.destroy_all

#Create 20 classes
20.times do
    Course.create!(
      name: Faker::Educator.course_name,
      crn: Faker::Number.unique.number(digits: 5),
      subject_area: Faker::Educator.subject,
      instructor: Faker::Name.name,
      college: "Letters and Science"
    )
  end
  