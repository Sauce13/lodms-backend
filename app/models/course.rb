class Course < ApplicationRecord
    has_many :students
    has_many :course_instructors
    has_many :instructors, through: :course_instructors
end
