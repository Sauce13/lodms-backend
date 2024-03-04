class Student < ApplicationRecord
    has_many :course_students
    has_many :courses, through: :course_students
    has_many :performance_indicators
    belongs_to :user
end
