class Course < ApplicationRecord
    has_many :course_student
    has_many :students, through: :course_student
    has_many :course_instructors
    has_many :instructors, through: :course_instructors
end
